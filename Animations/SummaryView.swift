//
//  SummaryView.swift
//  Animations
//
//  Created by Kevin Boulala on 14/02/2025.
//

import SwiftUI

struct SummaryView: View {
    
    private enum Summary: Int, Hashable {
        case animations, transitions, doubleAlert, viewsAndModifiers, betterRest, showUser, listManipulation, navigation, programmaticNavigation, differentTypesNavigation, navigationPath, randomNavigation, cupcakeCorner, imageFromRemote, taylorSwiftResults, haptic, fizzBuzz, markdown, lettersUnique, uniqueOccurences, countNeedlesView, palindrome, removingDuplicateLetters, matchingAnagrams, countNumbers, condenseWhitespace, findingPangrams, functionsFromFunctions, sortingByFrequency, squareRoots, matchingSocks, inPlaceReversal, sentencesByNumbers, findLongestPrefix, formExperimentation, findMajorityValue, textFieldTextEditor, bookworm, instafilter, alertDialogSheet, photoViewer, note, buscaWeather
        
        var description: String {
            return switch self {
            // SwiftUI
            case .animations:
                "🏀 Animations"
            case .transitions:
                "🟪 Transitions"
            case .viewsAndModifiers:
                "☎️ Playground (Views, Modifiers, ...)"
            case .imageFromRemote:
                "🌄 Image from remote"
            case .taylorSwiftResults:
                "🎤 Taylor Swift Results"
            case .haptic:
                "🐝 Haptic effects"
            case .listManipulation:
                "📋 List manipulation"
            case .markdown:
                "📝 Markdown"
            case .formExperimentation:
                "☑️ Form Experimentation"
            case .textFieldTextEditor:
                "✍️ TextField vs TextEditor"
            case .alertDialogSheet:
                "⚠️ Alert, ConfirmationDialog, Sheet"
            case .photoViewer:
                "📸 Photo Viewer"
            // Navigation
            case .showUser:
                "Show stuff in a Sheet"
            case .navigation:
                "Basic navigation with a NavigationLink"
            case .programmaticNavigation:
                "Programmatic navigation with a path (array)"
            case .differentTypesNavigation:
                "Different types with path navigation"
            case .navigationPath:
                "Navigation with NavigationPath"
            case .randomNavigation:
                "Random Navigation and return to Home"
            // Mini Apps
            case .betterRest:
                "💤 Better Rest"
            case .cupcakeCorner:
                "🧁 Cupcake Corner"
            case .bookworm:
                "📚 Bookworm"
            case .instafilter:
                "📸 Instafilter"
            case .note:
                "📝 Note"
            case .buscaWeather:
                "⛅️ Busca Weather"
            // Challenges - Fun
            case .fizzBuzz:
                "Fizz Buzz"
            case .lettersUnique:
                "Are the letters unique?"
            case .uniqueOccurences:
                "Are the letter occurences unique?"
            case .countNeedlesView:
                "Needles in a haystack"
            case .palindrome:
                "Is a string a palindrome?"
            case .removingDuplicateLetters:
                "Removing duplicate letters"
            case .matchingAnagrams:
                "Matching anagrams"
            case .countNumbers:
                "Count the numbers"
            case .condenseWhitespace:
                "Condense whitespace"
            case .findingPangrams:
                "Finding pangrams"
            case .functionsFromFunctions:
                "Function from functions"
            case .sortingByFrequency:
                "Sorting by frequency"
            case .squareRoots:
                "Square roots"
            case .matchingSocks:
                "Matching socks"
            case .inPlaceReversal:
                "In-place reversal"
            case .sentencesByNumbers:
                "Sentences by numbers"
            case .findLongestPrefix:
                "Find longest prefix"
            case .findMajorityValue:
                "Find the majority value"
            // Bugs
            case .doubleAlert:
                "Alerts chained"
            }
        }
        
        var view: some View {
            VStack {
                switch self {
                case .animations:
                    AnimationsView()
                case .transitions:
                    TransitionView()
                case .doubleAlert:
                    DoubleAlertView()
                case .viewsAndModifiers:
                    ViewsAndModifiersView()
                case .betterRest:
                    BetterRest()
                case .showUser:
                    ShowUserView()
                case .listManipulation:
                    ListManipulationView()
                case .navigation:
                    NavigationLinkView()
                case .programmaticNavigation: // ⚠️
                    ProgrammaticNavigationView()
                case .differentTypesNavigation:
                    DifferentTypesNavigationView()
                case .navigationPath: // ⚠️
                    NavigationPathView()
                case .randomNavigation: // ⚠️
                    RandomNavigationView()
                case .cupcakeCorner:
                    CupcakeCornerView()
                case .imageFromRemote:
                    ImageFromRemote()
                case .taylorSwiftResults:
                    TaylorSwiftResults()
                case .haptic:
                    HapticView()
                case .fizzBuzz:
                    FizzBuzzView()
                case .markdown:
                    MarkdownView()
                case .lettersUnique:
                    LettersUniqueView()
                case .uniqueOccurences:
                    LetterOccurencesUniqueView()
                case .countNeedlesView:
                    CountNeedlesView()
                case .palindrome:
                    PalindromeView()
                case .removingDuplicateLetters:
                    RemovingDuplicateLettersView()
                case .matchingAnagrams:
                    MatchingAnagramsView()
                case .countNumbers:
                    CountNumbersView()
                case .condenseWhitespace:
                    CondenseWhitespaceView()
                case .findingPangrams:
                    FindingPangramsView()
                case .functionsFromFunctions:
                    FunctionsFromFunctionsView()
                case .sortingByFrequency:
                    SortingByFrequencyView()
                case .squareRoots:
                    SquareRootsView()
                case .matchingSocks:
                    MatchingSocksView()
                case .inPlaceReversal:
                    InPlaceReversalView()
                case .sentencesByNumbers:
                    SentencesByNumbersView()
                case .findLongestPrefix:
                    FindLongestPrefixView()
                case .formExperimentation:
                    FormExperimentationView()
                case .findMajorityValue:
                    FindMajorityValueView()
                case .textFieldTextEditor:
                    TextFieldTextEditorView()
                case .bookworm:
                    BookwormView()
                case .instafilter:
                    InstafilterView()
                case .alertDialogSheet:
                    AlertDialogSheetView()
                case .photoViewer:
                    PhotoViewerView()
                case .note:
                    NoteView()
                case .buscaWeather:
                    BuscaWeatherView()
                }
            }
        }
        
        static let swiftUIItems: [Summary] = [.animations, .transitions, .imageFromRemote, .viewsAndModifiers, .listManipulation, .taylorSwiftResults, .haptic, .markdown, .formExperimentation, .textFieldTextEditor, .alertDialogSheet, .photoViewer]
        static let navigationItems: [Summary] = [.showUser, .navigation, .differentTypesNavigation]
        static let appItems: [Summary] = [.betterRest, .cupcakeCorner, .bookworm, .instafilter, .note, .buscaWeather]
        static let funs: [Summary] = [.fizzBuzz, .lettersUnique, .uniqueOccurences, .countNeedlesView, .palindrome, .removingDuplicateLetters, .matchingAnagrams, .countNumbers, .condenseWhitespace, .findingPangrams, .functionsFromFunctions, .sortingByFrequency, .squareRoots, .matchingSocks, .inPlaceReversal, .sentencesByNumbers, .findLongestPrefix, .findMajorityValue]
        static let bugItems: [Summary] = [.doubleAlert]
    }
    
    @State private var easterEggPresented = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                List {
                    Section {
                        ForEach(Summary.appItems, id: \.self) { item in
                            NavigationLink(item.description, value: item)
                        }
                    } header: {
                        Text("Mini APP")
                    }
                    
                    Section {
                        ForEach(Summary.swiftUIItems, id: \.self) { item in
                            NavigationLink(item.description, value: item)
                                .gesture(LongPressGesture()
                                    .onEnded { _ in
                                        easterEggPresented = item == Summary.transitions
                                    }
                                )
                        }
                    } header: {
                        Text("SwiftUI experimentation")
                    }
                    
                    Section {
                        ForEach(Summary.navigationItems, id: \.self) { item in
                            NavigationLink(item.description, value: item)
                        }
                    } header: {
                        Text("Navigation")
                    }
                    
                    Section {
                        ForEach(Summary.funs, id: \.self) { item in
                            NavigationLink(item.description, value: item)
                        }
                    } header: {
                        Text("Challenges - Fun")
                    }
                    
                    Section {
                        ForEach(Summary.bugItems, id: \.self) { item in
                            NavigationLink(item.description, value: item)
                        }
                    } header: {
                        Text("Bugs")
                    }
                }
            }
            .navigationDestination(for: Summary.self) { item in
                item.view
            }
            .sheet(isPresented: $easterEggPresented) {
                VandaleView()
            }
        }
    }
}

#Preview {
    SummaryView()
}
