### 🚀 What it does:
May the force be with you! You are looking at the Star Wars app that uses the https://swapi.dev API to display episodes. You can select an episode of the saga, view its details, and also check the details of the characters featured in it.

### Architecture:
Built using the MVVM (Model-View-ViewModel) pattern—at least, that’s how I understand it! The minimum target is iOS 16. I could go further, but I always think that my mother's phone can't update to a version higher than 16.

### Assumptions
* The API doesn't provide any pictures. How can design be cool without pictures? Therefore, I added a few to the project.
* Only one theme and orientation were implemented due to lack of time.
* Everything should be tested when time is unlimited. Therefore, I only covered the most complicated class with tests – but at 100% coverage.
* Instead of calling the characters API every time you tap on a film, I decided to fetch all characters at once and then filter them by film. This results in only one API call versus more than 10 every time the user enters a film's details. It is a solid and simple solution when working with a single film series, where some characters appear in multiple films.
* ### If I had more time...
  * The mandatory addition would be caching (e.g., using NSCache) to reduce the load on the API if the data remains consistent for extended periods.
  * Add a dark theme and choose more appropriate colors.
  * Fully utilize the API to fetch and display data about ships, planets, vehicles, etc.

### Error handling:
During data loading or if an error occurs later, the app overlays an alert with an error view on top of the last successfully loaded content.
## Preview
<p align="center">
      <img src="https://raw.githubusercontent.com/advanc3dUA/StarWars/main/Screenshots/Example-1.png" alt= "project Logo" width="250">
      <img src="https://raw.githubusercontent.com/advanc3dUA/StarWars/main/Screenshots/Example-2.png" alt= "project Logo" width="250">
</p>
