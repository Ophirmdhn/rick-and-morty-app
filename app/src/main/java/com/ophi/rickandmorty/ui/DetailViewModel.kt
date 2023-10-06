package com.ophi.rickandmorty.ui

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.ophi.rickandmorty.data.response.DetailCharacterResponse
import com.ophi.rickandmorty.data.retrofit.ApiConfig
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class DetailViewModel : ViewModel() {

    private val _detailCharacter = MutableLiveData<DetailCharacterResponse>()
    val detailCharacter: LiveData<DetailCharacterResponse> = _detailCharacter

    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> = _isLoading

    companion object {
        private const val TAG = "DetailViewModel"
    }

    fun getDetail(id: Int) {
        _isLoading.value = true
        val client = ApiConfig.getApiService().getDetailCharacter(id)
        client.enqueue(object : Callback<DetailCharacterResponse> {
            override fun onResponse(
                call: Call<DetailCharacterResponse>,
                response: Response<DetailCharacterResponse>
            ) {
                _isLoading.value = false
                if (response.isSuccessful) {
                    _detailCharacter.value = response.body()
                    Log.d("findCharacter", "onCreate: ${response.message()}")
                } else {
                    Log.e(TAG, "onFailure: Error ${response.message()}")
                }
            }

            override fun onFailure(call: Call<DetailCharacterResponse>, t: Throwable) {
                _isLoading.value = false
                Log.e(TAG, "onFailure: ${t.message.toString()}")
            }
        })
    }
}