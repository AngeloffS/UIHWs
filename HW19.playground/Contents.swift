import UIKit

////1) Постарайтесь по больше по практиковаться, повторите то, что есть в видео.
//
////Определение классовой иерархии для приведения типов
//
//class Media {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Film: Media {
//    var director: String
//
//    init(name: String, director: String) {
//        self.director = director
//        super.init(name: name)
//    }
//}
//
//class Music: Media {
//    var artist: String
//
//    init(name: String, artist: String) {
//        self.artist = artist
//        super.init(name: name)
//    }
//}
//
//let mediaArray: [Media] = [Film.init(name: "Casablanca", director: "Michael"),
//                           Music.init(name: "Blue Shies", artist: "Elvis Presley"),
//                           Film.init(name: "Kane", director: "Citrizen"),
//                           Music.init(name: "The only", artist: "Chesney"),
//                           Film.init(name: "Never Gonna ", director: "Rick Astley")]
//
////Проверка типов
//
//var count = (musicCount: 0, filmCount: 0)
//
//for obj in mediaArray {
//    if obj is Film {
//        count.filmCount += 1
//    } else if obj is Music {
//        count.musicCount += 1
//    }
//}
//
//print("В Вашем плеере находится \(count.filmCount) фильмов и \(count.musicCount) песен")
//
////Понижающее привидение
//
//for value in mediaArray {
//
//    if let musics = value as? Music {
//        print("Song \(musics.name) by \(musics.artist)")
//    } else if let films = value as? Film {
//        print("Movie \(films.name) dir \(films.director)")
//    }
//}


//2) Зайти обязательно и познакомиться с документацией.


/*
3) Я как заказчик даю вам разработчику задания сделать : Библиотеку книг и видео библиотеку фильмов Реализовать:
3.1 Возможность добавлять новые книги и фильмы и после добавления должна происходить автоматическая сортировка по алфавиту в пределах жанра.
3.2 Метод- "Sort by mood" - фильмы должны быть отсортировать по настроению.
3.3 Такой же метод придумать для книг.
3.4 Возможность удалять книги.
3.5 Выводить количество фильмов и книг в библиотеке
3.6 Выводить количество книг по жанрам
3.7 Выводить количество фильмов по жанрам
3.8 Выводить уведомление о местонахождении книги, фильма (на руках, в библиотеке)
3.9 У каждой книги и фильма должны быть запись о людях, бравших ее ранее с указанием имени, даты выдачи и даты возврата.
3.10 Метод, который выводит адрес библиотеки и контактные данные.
3.11 Предусмотреть механизм, запрещающий выдачу отсутствующих и забранных книг.
3.12 Одному человеку запрещается иметь на руках более 5 книг, и более 3 фильмов.
*/

enum Mood {
    case happy
    case norm
    case sad
}

class Media {
    enum Genre: String, CaseIterable {
        case action
        case comedy
        case drama
        case melodramma
        case fantasy
        case horror
        case thriller
        case historical
    }
    
    var genre: Genre
    var name: String
    var mood: Mood
    var isAvailable: Bool = true
    var history: [(name: String, date: String)] = []
    
    init(genre: Genre, name: String, mood: Mood) {
        self.genre = genre
        self.name = name
        self.mood = mood
    }
}
    
    final class Book: Media {
        var author: String
        
        init(genre: Genre, name: String, mood: Mood, author: String) {
            self.author = author
            super.init(genre: genre, name: name, mood: mood)
        }
    }
    
    final class Movie: Media {
        var director: String
        
        init(genre: Genre, name: String, mood: Mood, director: String) {
            self.director = director
            super.init(genre: genre, name: name, mood: mood)
        }
    }
    
    final class Library {
        var books = [Book]()
        
        var customerJournal = [String: (books: Int, movies: Int)]()
        
        func addBook(_ book: Book) {
            self.books.append(book)
            books.sort { $0.genre.rawValue < $1.genre.rawValue && $0.name < $1.name }
        }
        
        func sortByMood(mood: Mood) -> [Book] {
            var moodArray = [Book]()
            moodArray = self.books.filter { $0.mood == mood }
            return moodArray
        }
        
        func deleteBook(_ name: String) {
            guard let bookIndex = books.firstIndex(where: { $0.name == name }) else {
                print("The book was not found!")
                return
            }
            books.remove(at: bookIndex)
        }
        
        func quanity() {
            print("There are \(books.count) books in this library.")
        }
        
        func quanityBooksByGenre() {
            var booksByGenre: [Media.Genre: Int] = [:]
            for genre in Media.Genre.allCases {
                for book in books {
                    if book.genre == genre {
                        booksByGenre[genre]? += 1
                    }
                }
            }
            print(booksByGenre)
        }
        
        func bookLocation(_ media: Media) {
            media.isAvailable ? print("This book is available in library") : print("This book is unavailable")
        }
        
        func takeBook(media: Media, name: String) {
                checkIsAvailable(media: media, name: name)
            }
        
        func validateBook(media: Media, name: String) {
            validateCustomer(media: media, name: name)
            
            media.isAvailable = false
            media.history += [(name, "Take away \(Date())")]
            writeHistory(media: media, name: name)
        }
        
        func validateCustomer(media: Media, name: String) {
            guard let customer = customerJournal[name] else { return }
            if customer.books == 5 && media is Book {
                print("You already have 5 books. Please return one first!")
            }
        }
        
        func writeHistory(media: Media, name: String) {
            if media is Book {
                guard let _ = customerJournal[name] else {
                    customerJournal[name] = (1, 0)
                    return
                }
                customerJournal[name]?.books += 1
            }
        }
        
        func checkIsAvailable(media: Media, name: String) {
            media.isAvailable ? validateBook(media: media, name: name) : print("Sorry! Book has already taken away.")
        }
        
        func returnBook(media: Media, name: String) {
            media.isAvailable = true
            media.history += [(name, "Returned \(Date())")]
            if media is Book {
                customerJournal[name]?.books -= 1
            }
        }
        
        func printAdress() {
            print("3/5 Vozdvizhenka Street, Moscow, Russia")
        }
    }

    final class Cinema {
        var movies = [Movie]()
        
        var customerJournal = [String: (movies: Int, books: Int)]()
        
        func addMovie(_ movie: Movie) {
            self.movies.append(movie)
            movies.sort { $0.genre.rawValue < $1.genre.rawValue && $0.name < $1.name }
        }
        
        func sortByMood(mood: Mood) -> [Movie] {
            var moodArray = [Movie]()
            moodArray = self.movies.filter { $0.mood == mood }
            return moodArray
        }
        
        func deleteMovie(_ name: String) {
            guard let movieIndex = movies.firstIndex(where: { $0.name == name }) else {
                print("The movie was not found!")
                return
            }
            movies.remove(at: movieIndex)
        }
        
        func quanity() {
            print("There are \(movies.count) movies in this cinema.")
        }
        
        func quanityMoviesByGenre() {
            var moviesByGenre: [Media.Genre: Int] = [:]
            for genre in Media.Genre.allCases {
                for movie in movies {
                    if movie.genre == genre {
                        moviesByGenre[genre]? += 1
                    }
                }
            }
            print(moviesByGenre)
        }
        
        func movieLocation(_ media: Media) {
            media.isAvailable ? print("This movie is available in cinema") : print("This movie is not available")
        }
        
        func takeMovie(media: Media, name: String) {
                checkIsAvailable(media: media, name: name)
            }
        
        func validateMovie(media: Media, name: String) {
            validateCustomer(media: media, name: name)
            
            media.isAvailable = false
            media.history += [(name, "Take away \(Date.now.description)")]
            writeHistory(media: media, name: name)
        }
        
        func validateCustomer(media: Media, name: String) {
            guard let customer = customerJournal[name] else { return }
            if customer.movies == 3 && media is Movie {
                print("You already have 3 movies. Please return one first!")
            }
        }
        
        func writeHistory(media: Media, name: String) {
            if media is Movie {
                guard let _ = customerJournal[name] else {
                    customerJournal[name] = (1, 0)
                    return
                }
                customerJournal[name]?.movies += 1
            }
        }
        
        func checkIsAvailable(media: Media, name: String) {
            media.isAvailable ? validateMovie(media: media, name: name) : print("Sorry! Movie has already taken away.")
        }
        
        func returnMovie(media: Media, name: String) {
            media.isAvailable = false
            media.history += [(name, "Returned \(Date.now.description)")]
            if media is Movie {
                customerJournal[name]?.movies -= 1
            }
        }
        
        func printAdress() {
            print("12 Mezhdunarodnaya str., Krasnogorsk")
        }
    }

let library = Library()
let cinema = Cinema()

let theUnstoppable = Movie(genre: .action, name: "Unstoppable", mood: .norm, director: "Sylvester Stallone")
let titanic = Movie(genre: .drama, name: "Titanic", mood: .sad, director: "James Cameron")
let oceansEleven = Movie(genre: .thriller, name: "Ocean's eleven", mood: .happy, director: "Steven Sodenberg")

cinema.addMovie(titanic)
cinema.addMovie(theUnstoppable)
cinema.addMovie(oceansEleven)

cinema.takeMovie(media: theUnstoppable, name: "Sergey")
print(cinema.customerJournal)
cinema.returnMovie(media: theUnstoppable, name: "Sergey")
print(cinema.customerJournal)
    
let bibly = Book(genre: .historical, name: "Bibly", mood: .happy, author: "God")
let greenMile = Book(genre: .melodramma, name: "Green mile", mood: .norm, author: "Steven King")
let gamlet = Book(genre: .drama, name: "Gamlet", mood: .sad, author: "William Sheqsoiris")

library.addBook(bibly)
library.addBook(greenMile)
library.addBook(gamlet)
    
library.takeBook(media: bibly, name: "Sergey")
print(library.customerJournal)
library.returnBook(media: bibly, name: "Sergey")
print(library.customerJournal)


for media in (library.books + cinema.movies) {
    print(media.history)
}


