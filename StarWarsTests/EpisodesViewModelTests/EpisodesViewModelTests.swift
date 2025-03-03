//
//  EpisodesViewModelTests.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import XCTest
@testable import StarWars

class EpisodesViewModelTests: XCTestCase {
    private var mockFilmsService: MockFilmsService!
    private var mockCharaсtersService: MockCharactersService!
    private var episodesViewModel: EpisodesViewModel!
    private var date: Date!
    private var films: [Film]!
    private var characters: [Character]!

    override func setUpWithError() throws {
        mockFilmsService = MockFilmsService()
        mockCharaсtersService = MockCharactersService()
        date = Date()

        films = [Film(characters: [""], created: date, director: "Creative Person", edited: date, episodeId: 1, openingCrawl: "Long long long text here", planets: [""], producer: "Another Guy", releaseDate: "2025-02-28", species: [""], starships: [""], title: "Clones Attack", url: "", vehicles: [""])]
        characters = [Character(birthYear: "1966", eyeColor: "Brown", films: [""], gender: "Male", hairColor: "Blond", height: "1.5m", homeworld: "", mass: "75", name: "Luke Skywalker", skinColor: "White", created: date, edited: date, species: [""], starships: [""], url: "", vehicles: [""])]

        mockFilmsService.films = films
        mockCharaсtersService.characters = characters

        episodesViewModel = EpisodesViewModel(filmsService: mockFilmsService, charactersService: mockCharaсtersService)
    }

    override func tearDownWithError() throws {
        mockFilmsService = nil
        mockCharaсtersService = nil
        date = nil
        films = nil
        characters = nil
        episodesViewModel = nil
    }

    func testEpisodesViewModel_WhenFetchDataExecuted_EpisodesCountIsNotZero() async throws {
        // Act
        await episodesViewModel.fetchData()

        // Assert
        XCTAssertNotNil(episodesViewModel.episodes, "Expected to receive some episodes")
    }

    func testEpisodesViewModel_WhenFetchDataExecuted_ReceiveOneEpisode() async throws {
        // Act
        await episodesViewModel.fetchData()

        // Assert
        XCTAssertEqual(episodesViewModel.episodes?.count, 1, "Expected to receive only one episode")
    }

    func testEpisodeViewModel_WhenFetchDataExecuted_EpisodeTitleIsCorrect() async throws {
        // Act
        await episodesViewModel.fetchData()
        let filmTitle = films.first?.title
        let episodeTitle = episodesViewModel.episodes?.first?.title

        // Assert
        XCTAssertEqual(filmTitle, episodeTitle, "Expected to set the same title for episode as it is in film")
    }

    func testEpisodesViewModel_WhenFetchDataExecuted_EpisodeContainsOneCharacter() async throws {
        // Act
        await episodesViewModel.fetchData()

        // Assert
        XCTAssertEqual(episodesViewModel.episodes?.first?.characters.count, 1, "Expected to receive only one character in the episode")
    }

    func testEpisodeViewModel_WhenFetchDataExecuted_EpisodesCharaterNameIsCorrect() async throws {
        // Act
        await episodesViewModel.fetchData()
        let characterName = characters.first?.name
        let episodeCharacterName = episodesViewModel.episodes?.first?.characters.first?.name

        // Assert
        XCTAssertEqual(characterName, episodeCharacterName, "Expected to receive the same name for character in episode as it is in the database")
    }

    func testEpisodeViewModel_WhenFetchDataExecuted_ReceiveError() async {
        // Arrange
        let failingFilmsService = FailingFilmsService()
        let failingEpisodeViewModel = EpisodesViewModel(filmsService: failingFilmsService, charactersService: mockCharaсtersService)

        // Act
        await failingEpisodeViewModel.fetchData()

        // Assert
        XCTAssertTrue(failingEpisodeViewModel.isShowingErrorAlert, "Error alert should be presented, when error occurres")
    }
}
