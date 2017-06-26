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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gigabox.movie.service.MovieService;
import com.gigabox.movie.vo.MovieVO;
import com.gigabox.movie.vo.RownumVO;

@Controller
@RequestMapping("/movie")
public class MovieController {

	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);

	@Inject
	private MovieService movieService;



	@RequestMapping(value = "/movieList", method = RequestMethod.GET)
	public String movieList(Model model) throws Exception {
		logger.info("=================================================");
		logger.info("MOVIE LIST PRINT OUT");
		RownumVO rownumVO = new RownumVO();
		logger.info("rownumVO= " + rownumVO.toString());
		model.addAttribute("rowEnd", rownumVO.getRowEnd());
		model.addAttribute("movieListRecent", movieService.movieListRecent(rownumVO));
		model.addAttribute("movieListCountRecent", movieService.movieListCountRecent());
		model.addAttribute("movieListTobe", movieService.movieListTobe(rownumVO));
		model.addAttribute("movieListCountTobe", movieService.movieListCountTobe());
		logger.info("=================================================");
		return "/movie/movieList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/movieList/recent/{count}", method = RequestMethod.GET)
	public ResponseEntity<List<MovieVO>> movieListMoreRecent(Model model, @PathVariable int count) throws Exception {
		logger.info("=================================================");
		logger.info("MOVIE LIST PRINT OUT MORE");
		logger.info("count= " + count);
		RownumVO rownumVO = new RownumVO();
		rownumVO.next(count);
		
		logger.info("rownumVO= " + rownumVO.toString());
		logger.info("=================================================");
		return new ResponseEntity<List<MovieVO>>(movieService.movieListRecent(rownumVO), HttpStatus.OK);
	}  
	
	@ResponseBody
	@RequestMapping(value = "/movieList/tobe/{count}", method = RequestMethod.GET)
	public ResponseEntity<List<MovieVO>> movieListMoreTobe(Model model, @PathVariable int count) throws Exception {
		logger.info("=================================================");
		logger.info("MOVIE LIST PRINT OUT MORE");
		logger.info("count= " + count);
		RownumVO rownumVO = new RownumVO();
		rownumVO.next(count);
		
		logger.info("rownumVO= " + rownumVO.toString());
		logger.info("=================================================");
		return new ResponseEntity<List<MovieVO>>(movieService.movieListTobe(rownumVO), HttpStatus.OK);
	}  
	

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

	
}
