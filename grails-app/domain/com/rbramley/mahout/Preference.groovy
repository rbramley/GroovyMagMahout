package com.rbramley.mahout

import org.apache.commons.lang.builder.HashCodeBuilder

class Preference implements Serializable {
    long userId
    long itemId
    float prefValue

    static constraints = {
        userId()
        itemId()
        prefValue range: 0.0f..5.0f
    }

    boolean equals(other) {
        if (!(other instanceof Preference)) {
            return false
        }

        other.userId == userId && other.itemId == itemId
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append userId
        builder.append itemId
        builder.toHashCode()
    }

    static mapping = {
        id composite: ['userId', 'itemId']
        version false
    }
}
