package com.virtualStockPlatform.entity;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.fasterxml.jackson.databind.JsonNode;

public class Price {
	// TODO https://www.baeldung.com/jackson-mapping-dynamic-object

	@JsonInclude(JsonInclude.Include.NON_NULL)
	@JsonPropertyOrder({
	"Meta Data",
	"Time Series (1min)"
	})

	@JsonProperty("Meta Data")
	private Map<String, Object> metaData;
	
	@JsonProperty("Time Series (1min)")
	private Map<String, Object> timeSeries;

	public Map<String, Object> getMetaData() {
		return metaData;
	}

	public void setMetaData(Map<String, Object> metaData) {
		this.metaData = metaData;
	}

	public Map<String, Object> getTimeSeries() {
		return timeSeries;
	}

	public void setTimeSeries(Map<String, Object> timeSeries) {
		this.timeSeries = timeSeries;
	}


	

}
