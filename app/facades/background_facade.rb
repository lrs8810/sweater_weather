class BackgroundFacade
  def initialize(location)
    @service ||= UnsplashService.get_background_json(location)
  end

  def get_background
    Background.new(@service)
  end
end
