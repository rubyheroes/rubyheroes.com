# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def button_tag(content_or_options_with_block = nil, options = nil, escape = true, &block)
    default_options = { "type" => "submit", "name" => "commit" }
    if block_given?
      content_tag "button", default_options.update(content_or_options_with_block || {}), options, escape, &block
    else
      content_tag "button", content_or_options_with_block, default_options.update(options || {}), escape, &block
    end
  end
  
  def button_to_log_in
    button_tag :class => "button" do
      image_tag_with_text("key.png", "Log in")
    end
  end
  
  def button_to_save(text)
    button_tag :class => "button positive" do
      image_tag_with_text("tick.png", text)
    end
  end
  
  def image_tag_with_text(source, text)
    "#{image_tag(source)} #{text}"
  end
  
  def link_to_add(text, path)
    link_to image_tag_with_text("add.png", text), path, :class => "button"
  end
  
  def link_to_cancel(path)
    link_to image_tag_with_text("cross.png", "Cancel"), path, :class => "button negative"
  end
  
  def link_to_delete(item, text, options = {})
    options.merge! :method => :delete
    link_to image_tag_with_text("delete.png", text), item, options
  end
  
  def link_to_edit(path)
    link_to image_tag_with_text("application_form_edit.png", "Edit"), path
  end
  
  def link_to_list(path)
    link_to image_tag_with_text("arrow_left.png", "Back to list"), path, :class => "button"
  end
  
  def revision
    File.exist?("REVISION") ? IO.readlines("REVISION")[0] : "unknown"
  end
  
  def select_model?(model, current_model)
    model && model.id == current_model.id ? { :class => "selected" } : {}
  end
  
  def select_new?(model)
    model && model.new_record? ? { :class => "selected" } : {}
  end
end
