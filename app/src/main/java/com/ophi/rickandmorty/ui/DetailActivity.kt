package com.ophi.rickandmorty.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.activity.viewModels
import com.bumptech.glide.Glide
import com.ophi.rickandmorty.data.response.DetailCharacterResponse
import com.ophi.rickandmorty.databinding.ActivityDetailBinding

class DetailActivity : AppCompatActivity() {

    private lateinit var binding: ActivityDetailBinding
    private val detailViewModel by viewModels<DetailViewModel>()

    companion object {
        const val EXTRA_ID = 1
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityDetailBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val id = intent.getIntExtra("id", EXTRA_ID)
        detailViewModel.getDetail(id)

        supportActionBar?.hide()

        detailViewModel.detailCharacter.observe(this) { detail ->
            setCharacter(detail)
        }

        detailViewModel.isLoading.observe(this) {
            showLoading(it)
        }
    }

    private fun setCharacter(detail: DetailCharacterResponse) {
        binding.apply {
            Glide.with(applicationContext)
                .load(detail.image)
                .into(imgDetail)
            tvDetailName.text = detail.name
            tvDetailSpecies.text = detail.species
            tvGenre.text = detail.gender
            tvStatus.text = detail.status
        }
    }

    private fun showLoading(state: Boolean) { binding.progressBar.visibility = if (state) View.VISIBLE else View.GONE }
}