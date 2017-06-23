package com.gigabox.movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gigabox.movie.service.MovieService;
import com.gigabox.movie.vo.MovieVO;

@Controller
@RequestMapping("/movie")
public class MovieController {

	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);

	@Inject
	private MovieService movieService;

	/*@RequestMapping(value = "/movieCreate", method = RequestMethod.GET)
	public void registerGET(MovieVO movie, Model model) throws Exception {
		logger.info("register get.....");
	}

	@RequestMapping(value = "/movieCreate", method = RequestMethod.POST)
	public String registerPOST(MovieVO movie, RedirectAttributes rttr) throws Exception {
		logger.info("regist post .....");
		logger.info(movie.toString());

		movieService.regist(movie);

		rttr.addFlashAttribute("msg", "SUCCESS");
		// return "/test/success";
		return "redirect:/movie/movieList";
	}*/

	@RequestMapping(value = "/movieList", method = RequestMethod.GET)
	public void movieList(Model model) throws Exception {
		logger.info("movieList.jsp ENTER...");
		model.addAttribute("movieList", movieService.movieList());
	}

	/*@RequestMapping(value = "/movieDelete/{movieNumber}", method = RequestMethod.POST)
	public String movieDelete(@PathVariable("movieNumber") int movieNumber) throws Exception {
		this.movieService.remove(movieNumber);
		return "redirect:/test/movieList";
	}*/

	@RequestMapping(value = "/movieDetail/{movieNumber}", method = RequestMethod.PUT)
	public ResponseEntity<MovieVO> moevieDetailRest(@PathVariable("movieNumber") int movieNumber) {
		logger.info("=======================================================");
		logger.info("MOVIE DETAIL DATA REQUESTED");
		MovieVO selectData = new MovieVO();
		selectData.setMovieNumber(movieNumber);
		MovieVO selectedData = movieService.movieDetail(selectData);
		logger.info("MovieVO= " + selectedData.toString());
		ResponseEntity<MovieVO> selectedMovieVO = new ResponseEntity<MovieVO>(selectedData, HttpStatus.OK);

		logger.info("MOVIE DETAIL DATA SENT TO JSON");
		logger.info("=======================================================");
		return selectedMovieVO;
	}

	@RequestMapping(value = "/readMore", method = RequestMethod.GET)
	public @ResponseBody List<MovieVO> readMore(@RequestBody MovieVO movieVO) throws Exception {
		logger.info("readMore is called.....");

		int mnoToStart = movieVO.getMovieNumber() - 1;

		return movieService.readMore(mnoToStart);
	}
}
