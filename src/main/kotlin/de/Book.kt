package de

import javax.persistence.*

@Entity
data class Book(
    @Id
    @GeneratedValue
    val id: Long,
    val title: String,
    val pages: Int
)
  