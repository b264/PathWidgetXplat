package com.sixbynine.transit.path.api

import com.sixbynine.transit.path.app.ui.ColorWrapper
import kotlinx.datetime.Instant
import kotlinx.serialization.Serializable

data class DepartureBoardTrain(
    val headsign: String,
    val projectedArrival: Instant,
    val lineColors: List<ColorWrapper>,
    val isDelayed: Boolean,
    val backfillSource: BackfillSource?,
    val directionState: State?,
    val lines: Set<Line>,
)

@Serializable
data class BackfillSource(
    val station: Station,
    val projectedArrival: Instant,
)
