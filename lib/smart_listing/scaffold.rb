module SmartListing::Scaffold
  include SmartListing::Helper::ControllerExtensions

  def self.included(klass)
    klass.helper(SmartListing::Helper)
    klass.respond_to(:html, :js)
  end

  def index
    smart_listing_create plural_resource_sym, resource_class.all,
      partial: "#{controller_name}/list"
  end

  private

  def build_resource_params
    [params.fetch(singular_resource_sym, {}).permit(columns)]
  end

  def columns
    [:name]
  end

  def plural_resource_sym
    controller_name.to_sym
  end

  def singular_resource_sym
    controller_name.singularize.to_sym
  end

  def resource_class
    controller_name.camelize.singularize.constantize
  end
end
