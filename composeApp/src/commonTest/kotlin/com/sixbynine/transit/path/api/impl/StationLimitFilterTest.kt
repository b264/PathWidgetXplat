package com.sixbynine.transit.path.api.impl

import com.sixbynine.transit.path.Logging
import com.sixbynine.transit.path.app.settings.StationLimit.OnePerLine
import com.sixbynine.transit.path.app.ui.ColorWrapper
import com.sixbynine.transit.path.app.ui.Colors
import com.sixbynine.transit.path.app.ui.home.HomeScreenContract.TrainData
import com.sixbynine.transit.path.app.ui.home.StationLimitFilter
import com.sixbynine.transit.path.app.ui.home.filter
import kotlinx.datetime.Clock.System
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.time.Duration
import kotlin.time.Duration.Companion.minutes

class StationLimitFilterTest {

    @BeforeTest
    fun setUp() {
        Logging.setTest()
    }

    @Test
    fun `one per line`() {
        val filter = StationLimitFilter(OnePerLine)

        val trainData = listOf(
            trainData("Newark", Colors.NwkWtc, 1.minutes),
            trainData("World Trade Center", Colors.NwkWtc, 2.minutes),
            trainData("Newark", Colors.NwkWtc, 3.minutes),
            trainData("World Trade Center", Colors.NwkWtc, 3.minutes),
            trainData("World Trade Center", Colors.HobWtc, 3.minutes),
        )

        val filtered = trainData.filter(filter).map { it.title }
        assertEquals(listOf("Newark", "World Trade Center"), filtered)
    }

    private fun trainData(title: String, colors: List<ColorWrapper>, fromNow: Duration): TrainData {
        return TrainData(
            "1",
            title,
            colors = colors,
            projectedArrival = System.now() + fromNow,
            displayText = "foo"
        )
    }
}