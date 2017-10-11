require 'fileutils'
require 'pathname'
require 'rake'
require 'haml'
require 'redcarpet'

class GHPagesGenerator
  EXCLUDE_FILES = %w(README.md _template.md)

  def initialize(dir)
    @dir = dir
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end

  def generate
    docs_dir = File.expand_path('docs', @dir)
    FileUtils.mkdir_p(docs_dir)

    mdlist = Pathname.glob(@dir + '/*.md').reject{|p| EXCLUDE_FILES.include?(p.basename.to_s) }
    haml = Pathname.new(File.expand_path('../index.haml', __FILE__))

    convert_haml(haml, Pathname.new(File.expand_path('index.html', docs_dir)), mdlist: mdlist)

    mdlist.each do |md|
      convert_markdown(md, Pathname.new(File.expand_path(md.basename.sub(/\.md$/, '.html'), docs_dir)))
    end
  end

  def convert_haml(haml_file, html_file, **locals)
    engine = Haml::Engine.new(haml_file.read)
    context = Object.new
    html_file.write engine.render(context, locals)
  end

  def convert_markdown(md_file, html_file)
    haml = Pathname.new(File.expand_path('../indiv.haml', __FILE__))
    engine = Haml::Engine.new(haml.read)
    context = Object.new
    html_file.write engine.render(context, body: @markdown.render(md_file.read))
  end

  class Task
    include ::Rake::DSL
    def initialize(task_name)
      task task_name do
        GHPagesGenerator.new('.').generate
      end
    end
  end
end
