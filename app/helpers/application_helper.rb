module ApplicationHelper
    include Pagy::Frontend
    
    def active_link_to(name = nil, options = nil, html_options = nil, &block)
        active_class = html_options[:active] || "bg-gray-900"
        inactive_class = html_options[:active] || "hover:bg-gray-700"
        html_options.delete(:active)

        html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
        html_options[:class] = "#{html_options[:class]} #{inactive_class}" if !current_page?(options)
        link_to(name, options, html_options, &block)
    end
end
