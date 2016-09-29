########################### A L B U M S #########################
def n_plus_one_tracks
  albums = self.albums
  tracks_count = {}
  albums.each { |album| tracks_count[album.name] = album.tracks.length }

  tracks_count
end

def better_tracks_query
  albums = self.albums.include(:tracks)
  tracks_count = {}
  albums.each { |album| track_counts[album] = album.tracks.length }

  track_count
end

######################## P L A N T S ###########################


def better_seeds_query
  plants = self.plants.include(:seeds)
  seeds = []

  plants.each { |plant| seeds << plant.seeds }
  seeds
  end
end

######################## B U S   D R I V E R S ###########################

def better_drivers_query
  buses = self.buses.include(:drivers)
  all_drivers = {}
  drivers = []

  buses.each do |bus|
    bus.drivers.each do |driver|
      drivers << driver.name
    end

    all_drivers[bus.id] = drivers
  end

  all_drivers
end
