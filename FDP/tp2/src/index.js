var Image = React.createClass({
  render: function () {
      return (
          <img className="image" src={this.props.src} />
    );
  }
});

var ImageList = React.createClass({
    render: function () {
	var images = this.props.images.items.map(function (img, index) {
	  return (
		  <Image src={img.media.m} key={index} />
	  );
      });
      return (
	  <ul className="imageList" >
              {images}
	  </ul>
      );
  }
});

var SearchForm = React.createClass({
    onSubmit: function (e) {
	e.preventDefault();
	
	var tag = this.refs.tag.getDOMNode().value.trim();
	
	if (! tag) return;

	this.props.handleSearchSubmit(tag);
    },
    render: function () {
	return (
	    <div className="searchForm" >
		<form onSubmit={this.onSubmit} >
		    <input type="text" ref="tag" />
		    <input type="submit" value="Chercher" />
		</form>
	    </div>
	);
    }
});

var ImageBox = React.createClass({
    loadImagesFlickr: function () {console.log("maj");
	$.getJSON(this.props.flickrAPI, {
	    tags: this.state.tag,
	    tagmode: "any",
	    format: "json"
	}).done(function (data) {
	    this.setState({images: data});
	}.bind(this));
    },
    getInitialState: function () {
	return {images: {items: []}, tag: "cat"};
    },
    componentDidMount: function () {
	this.loadImagesFlickr();
	setInterval(this.loadImagesFlickr, this.props.pollInterval);
    },
    handleSearchSubmit: function (tag) {
	this.setState({tag: tag}, this.loadImagesFlickr);
    },
    render: function () {
	return (
	    <div className="imageBox" >
		<SearchForm handleSearchSubmit = {this.handleSearchSubmit} />
		<ImageList images = {this.state.images} />
	    </div>
	);
    }
});

React.render(
    <ImageBox flickrAPI = "http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?" pollInterval={60000} />,
    document.getElementById("content")
);
