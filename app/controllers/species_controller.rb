class SpeciesController < InheritedResources::Base
  load_and_authorize_resource

  include SmartListing::Scaffold
end
