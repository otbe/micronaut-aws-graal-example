package de

import io.micronaut.runtime.Micronaut

object Application {

    @JvmStatic
    fun main(args: Array<String>) {
        Micronaut.build()
                .packages("de")
                .mainClass(Application.javaClass)
                .start()
    }
}