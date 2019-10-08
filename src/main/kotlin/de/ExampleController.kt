package de

import io.micronaut.http.annotation.*

@Controller("/")
class ExampleController(
    private val bookRepository: BookRepository
) {

    @Get("/ping")
    fun index(): String {
        println(bookRepository.count())
        return "{\"pong\":true, \"graal\": true}"
    }
}

