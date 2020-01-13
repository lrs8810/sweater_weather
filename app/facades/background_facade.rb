class BackgroundFacade
  def initialize(location)
    @service ||= UnsplashService.get_background(location)
  end
end
