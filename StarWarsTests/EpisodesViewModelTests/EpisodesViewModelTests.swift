//
//  EpisodesViewModelTests.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import XCTest
@testable import StarWars

final class EpisodesViewModelTests: XCTestCase {
    private var mockFilmsService: MockFilmsService!
    private var mockCharatersService: MockCharactersService!
    private var episodesViewModel: EpisodesView.EpisodesViewModel!
    private var date: Date!
    private var films: [Film]!
    private var characters: [Character]!

    override func setUpWithError() throws {
        mockFilmsService = MockFilmsService()
        mockCharatersService = MockCharactersService()
        date = Date()
        
        films = [Film(characters: [""], created: date, director: "Creative Person", edited: date, episodeId: 1, openingCrawl: "Long long long text here", planets: [""], producer: "Another Guy", releaseDate: "2025-02-28", species: [""], starships: [""], title: "Clones Attack", url: "", vehicles: [""])]
        characters = [Character(birthYear: "1966", eyeColor: "Brown", films: [""], gender: "Male", hairColor: "Blond", height: "1.5m", homeworld: "", mass: "75", name: "Luke Skywalker", skinColor: "White", created: date, edited: date, species: [""], starships: [""], url: "", vehicles: [""])]
        
        mockFilmsService.films = films
        mockCharatersService.characters = characters
        
        episodesViewModel = EpisodesView.EpisodesViewModel(filmsService: mockFilmsService, charactersService: mockCharatersService)
    }

    override func tearDownWithError() throws {
        mockFilmsService = nil
        mockCharatersService = nil
        date = nil
        films = nil
        characters = nil
        episodesViewModel = nil
    }
    
    func testEpisodesViewModel_WhenFetchDataExecuted_EpisodesCountIsNotZero() async throws {
        // Act
        await episodesViewModel.fetchData()
        
        // Assert
        XCTAssertNotNil(episodesViewModel.episodes, "Expected to receive some episodes, but it didn't")
    }
    
    func testEpisodesViewModel_WhenFetchDataExecuted_ReceiveOneEpisode() async throws {
        // Act
        await episodesViewModel.fetchData()
        
        // Assert
        XCTAssertEqual(episodesViewModel.episodes?.count, 1, "Expected to receive only one episode, but the number is different")
    }
    
    func testEpisodeViewModel_WhenFetchDataExecuted_EpisodeTitleIsCorrect() async throws {
        // Act
        await episodesViewModel.fetchData()
        let filmTitle = films.first?.title
        let episodeTitle = episodesViewModel.episodes?.first?.title
        
        // Assert
        XCTAssertEqual(filmTitle, episodeTitle, "Expected to set the same title for episode as it is in film, but they are different")
    }
    
    func testEpisodesViewModel_WhenFetchDataExecuted_EpisodeContainsOneCharacter() async throws {
        // Act
        await episodesViewModel.fetchData()
        
        // Assert
        XCTAssertEqual(episodesViewModel.episodes?.first?.characters.count, 1, "Expected to receive only one character in the episode, but the number is different")
    }
    
    func testEpisodeViewModel_WhenFetchDataExecuted_EpisodesCharaterNameIsCorrect() async throws {
        // Act
        await episodesViewModel.fetchData()
        let characterName = characters.first?.name
        let episodeCharacterName = episodesViewModel.episodes?.first?.characters.first?.name
        
        // Assert
        XCTAssertEqual(characterName, episodeCharacterName, "Expected to receive the same name for character in episode as it is in the database, but they are different")
    }
    
    func testEpisodeViewModel_WhenFetchDataExecuted_ReceiveError() async {
        // Arrange
        let failingFilmsService = FailingFilmsService()
        let failingEpisodeViewModel = EpisodesView.EpisodesViewModel(filmsService: failingFilmsService, charactersService: mockCharatersService)
        
        // Act
        await failingEpisodeViewModel.fetchData()
        
        // Assert
        XCTAssertTrue(failingEpisodeViewModel.isShowingErrorAlert, "Error alert should be presented, when error occures, but it wasn't")
    }
}
