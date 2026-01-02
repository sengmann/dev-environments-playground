package com.se.backend.rest

import com.se.backend.Training
import com.sun.beans.introspect.PropertyInfo
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.RequestMapping

@RestController
@RequestMapping("/trainings")
class TrainingsController {

    @GetMapping()
    fun getTrainings(): List<Training> {
        return listOf(
            Training(
                id = 1,
                name = "Angular",
                description = "One of the best frontend frameworks made easy",
                price = 999.0
            ),
            Training(
                id = 2,
                name = "TypeScript",
                description = "For frontend and backend, learn once be happy",
                price = 499.0
            ),
            Training(
                id = 3,
                name = "Nix",
                description = "Complicated stuff, but usefully and also can be fun (after a while)",
                price = 9999.0
            ),
        )
    }
}
