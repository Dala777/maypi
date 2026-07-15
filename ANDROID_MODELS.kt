package com.torrezpillcokevin.nuna.models

import com.google.gson.annotations.SerializedName

data class EmergencyAlertRequest(
    @SerializedName("user_id")
    val userId: Int,
    
    @SerializedName("latitude")
    val latitude: Double,
    
    @SerializedName("longitude")
    val longitude: Double,
    
    @SerializedName("description")
    val description: String? = null,
    
    @SerializedName("device_name")
    val deviceName: String? = null
)

data class EmergencyAlertResponse(
    @SerializedName("message")
    val message: String,
    
    @SerializedName("data")
    val data: EmergencyAlertData
)

data class EmergencyAlertData(
    @SerializedName("id")
    val id: Int,
    
    @SerializedName("user_id")
    val userId: Int,
    
    @SerializedName("latitude")
    val latitude: Double,
    
    @SerializedName("longitude")
    val longitude: Double,
    
    @SerializedName("description")
    val description: String? = null,
    
    @SerializedName("device_name")
    val deviceName: String? = null,
    
    @SerializedName("status")
    val status: String,
    
    @SerializedName("created_at")
    val createdAt: String,
    
    @SerializedName("updated_at")
    val updatedAt: String
)
