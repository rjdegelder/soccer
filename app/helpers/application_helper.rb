module ApplicationHelper

  def translate_attribute klass, attribute
    t(attribute, :scope => [:activerecord, :attributes, klass])
  end
  alias_method :ta, :translate_attribute

end
