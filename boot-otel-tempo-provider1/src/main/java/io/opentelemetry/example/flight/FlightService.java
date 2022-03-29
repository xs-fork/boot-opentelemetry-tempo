package io.opentelemetry.example.flight;

import io.opentelemetry.example.flight.repository.FlightRepository;
import io.opentelemetry.example.flight.repository.entity.Flight;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class FlightService {

	private static final Logger LOGGER = LoggerFactory.getLogger(FlightService.class);
	
	private FlightRepository flightRepository;
	
	public FlightService(FlightRepository repository) {
		this.flightRepository = repository;
	}

	public Iterable<Flight> getFlights(String origin) {
//		doSomeWorkNewSpan();
		return flightRepository.findAll();
	}

//	@WithSpan
//    public void doSomeWorkNewSpan() {
//		LOGGER.info("Doing some work In New span");
//        Span span = Span.current();
//
//        span.setAttribute("template.a2", "some value");
//
//        span.addEvent("template.processing2.start", atttributes("321"));
//        span.addEvent("template.processing2.end", atttributes("321"));
//    }
//
//    private Attributes atttributes(String id) {
//        return Attributes.of(AttributeKey.stringKey("app.id"), id);
//    }
}
