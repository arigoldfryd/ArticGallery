## Architecture

![Architecture](https://github.com/arigoldfryd/ArticGallery/assets/12650891/f00f2723-6281-4175-94e3-eca8510ebe40)

The main app has been made as simple as possible. It's modularized using Swift Packages, and uses four packages:

1. List
2. Detail
3. Models
4. Network

### List and Detail

The view packages use an MVVM architecture. Although the `ViewModel` is designed to share responsibilities with the `View`, it isn't necessary at all and could be included in the view. 

The `ViewModel` has the following responsibilities:
* Retrieve the information using the `Repository`.
* Map the models of the API to a ready-to-use `Model` for the view, so that the view doesn't have any business logic.
* Handle pagination.

### Models

This package has two kinds of models:
1. `Response`: These are the endpoint responses without any modifications. There are two: `ArtistResponse` and `ArtworksResponse`.
2. `Model`: These are the models that views can access. They contain information as it should be displayed.

The goal of having two different types of models is to keep the complexity of the API response out of the view model.

### Network

There are two repositories used to retrieve information, and each repository knows how to call a single endpoint.

 * `ArtworksRepository`: Fetches the list of artworks using pagination.
 * `ArtistRepository`: Fetches the details of a specific artist.

Each repository uses two clients to access the information:
1. `RemoteClient`: This client retrieves information from remote sources (also known as APIs).
2. `LocalClient`: This client gets information from local sources on the device. In this case, it's from the `UserDefaults`.

## External Libraries

I've only used one external library for this application: [Nuke](https://github.com/kean/Nuke) to cache downloaded images.
