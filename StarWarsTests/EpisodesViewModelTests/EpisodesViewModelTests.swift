//
//  EpisodesViewModelTests.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import XCTest
@testable import StarWars

class EpisodesViewModelTests: XCTestCase {
    private var mockCharaсtersService: MockCharactersService!

    override func setUpWithError() throws {
        mockCharaсtersService = MockCharactersService()
        mockCharaсtersService.characters = Character.samplesArray
    }

    override func tearDownWithError() throws {
        mockCharaсtersService = nil
    }

    func testEpisodesViewModel_WhenFetchDataExecuted_EpisodesCountIsNotZero() async throws {
        // Arrange
        let mockFilmsService = MockFilmsService()
        mockFilmsService.films = Film.samplesArray
        let sut = EpisodesViewModel(filmsService: mockFilmsService, charactersService: mockCharaсtersService)

        // Act
        await sut.fetchData()

        // Assert
        XCTAssertNotNil(sut.episodes, "Expected to receive some episodes")
    }

    func testEpisodeViewModel_WhenFetchDataExecuted_ShowAlertAndThrowAppError() async {
        // Arrange
        let failingFilmsService = FailingFilmsService(error: AppError.filmsServiceError(.invalidURL))
        let sut = EpisodesViewModel(filmsService: failingFilmsService, charactersService: mockCharaсtersService)

        let expectedAppErrorDescription = "The operation couldn’t be completed. (StarWars.AppError error 1.)"

        // Act
        await sut.fetchData()

        // Assert
        XCTAssertTrue(sut.isShowingErrorAlert, "Error alert should be presented, when error occurs")
        XCTAssertEqual(expectedAppErrorDescription, sut.error?.localizedDescription, "Expected to throw AppError and show error alert")
    }

    func testEpisodeViewModel_WhenFetchDataExecuted_ShowAlertAndThrowOtherError() async {
        // Arrange
        let failingFilmsService = FailingFilmsService(error: URLError(.unknown))
        let sut = EpisodesViewModel(filmsService: failingFilmsService, charactersService: mockCharaсtersService)
        let expectedUrlErrorDescription = "The operation couldn’t be completed. (StarWars.AppError error 0.)"

        // Act
        await sut.fetchData()

        // Assert
        XCTAssertTrue(sut.isShowingErrorAlert, "Error alert should be presented, when error occurs")
        XCTAssertEqual(expectedUrlErrorDescription, sut.error?.localizedDescription, "Expected to throw other error and show error alert")
    }
}
