package com.ophi.rickandmorty.ui

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.ophi.rickandmorty.data.response.ResultsItem
import com.ophi.rickandmorty.data.response.RickAndMortyResponse
import com.ophi.rickandmorty.data.retrofit.ApiConfig
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class MainViewModel: ViewModel() {

    private val _listCharacter = MutableLiveData<List<ResultsItem>>()
    val listCharacter: LiveData<List<ResultsItem>> = _listCharacter

    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> = _isLoading

    companion object {
        private const val TAG = "MainViewModel"
    }

    init {
        findCharacter(1)
    }

    private fun findCharacter(page: Int) {
        _isLoading.value = true
        val client = ApiConfig.getApiService().getCharacter(page)
        client.enqueue(object : Callback<RickAndMortyResponse> {
            override fun onResponse(
                call: Call<RickAndMortyResponse>,
                response: Response<RickAndMortyResponse>
            ) {
                _isLoading.value = false
                if (response.isSuccessful) {
                    _listCharacter.value = response.body()?.results
                    Log.d("findCharacter", "onCreate: ${response.message()}")
                } else {
                    Log.e(TAG, "onFailure: Error ${response.message()}")
                }
            }

            override fun onFailure(call: Call<RickAndMortyResponse>, t: Throwable) {
                _isLoading.value = false
                Log.e(TAG, "onFailure: ${t.message.toString()}")
            }
        })
    }
}