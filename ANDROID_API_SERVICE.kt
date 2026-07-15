package com.torrezpillcokevin.nuna.api

import com.torrezpillcokevin.nuna.models.EmergencyAlertRequest
import com.torrezpillcokevin.nuna.models.EmergencyAlertResponse
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.Headers
import retrofit2.http.POST
import retrofit2.http.Query

interface ApiService {
    
    @POST("/api/v1/emergency-alerts")
    @Headers("Content-Type: application/json")
    suspend fun sendEmergencyAlert(
        @Body emergencyAlert: EmergencyAlertRequest
    ): Response<EmergencyAlertResponse>
    
    @GET("/api/v1/emergency-alerts")
    @Headers("Content-Type: application/json")
    suspend fun getEmergencyAlerts(
        @Query("page") page: Int = 1,
        @Query("size") size: Int = 10
    ): Response<Map<String, Any>>
}
