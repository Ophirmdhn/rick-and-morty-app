package com.ophi.rickandmorty.data.retrofit


import com.ophi.rickandmorty.data.response.DetailCharacterResponse
import com.ophi.rickandmorty.data.response.RickAndMortyResponse
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface ApiService {
    @GET("character")
    fun getCharacter(
        @Query("page") page: Int
    ): Call<RickAndMortyResponse>

    @GET("character/{id}")
    fun getDetailCharacter(
        @Path("id") id: Int
    ): Call<DetailCharacterResponse>
}
