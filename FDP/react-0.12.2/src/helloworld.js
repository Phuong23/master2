var md2html = new Showdown.converter();

var CommentForm = React.createClass({
  render: function () {
    return (
      <div className="CommentForm" >
            <span>Formulaire :</span>
      </div>
    );
  }
});

var CommentBox = React.createClass({
    getInitialState: function () {
	return {data: []};
    },
    loadCommentsFromServer: function () {
	$.ajax({
	    url: this.props.url,
	    dataType: "json",
	    success: function (data) {
		this.setState({data: data});
	    }.bind(this),
	    error: function (xhr, status, err) {
		console.error(this.props.url, status, err.toString());
	    }.bind(this)
	});
    },
    componentDidMount: function () {
	this.loadCommentsFromServer();
	setInterval(this.loadCommentsFromServer, this.props.pollInterval);
    },
    handleCommentSubmit: function () {
	
    },
    render: function () {
	return (
		<div className="CommentBox" >
		<span>Dernières déclarations :</span>
		<CommentList data={this.state.data} />
		<CommentForm />
		</div>
	);
    }
});

var CommentForm = React.createClass({
    handleSubmit: function (e) {
	e.preventDefault();
	
	var author = this.refs.author.getDOMNode().value.trim(),
	    text   = this.refs.author.getDOMNode().value.trim();
	
	if (! text || ! author) return;

	this.refs.author.getDOMNode().value = "";
	this.refs.text.getDOMNode().value = "";
	return;
    },
    render: function () {
	return (
	    <div className="CommentForm" >
		<strong>Un commentaire ?</strong>
		<form onSubmit={this.handleSubmit} >
		    <input type="text" placeholder="votre stupide nom" ref="author" /> <br />
		    <textarea placeholder="votre stupide commentaire" ref="text" ></textarea> <br />
		    <input type="submit" value="Participer !" />
		</form>
	    </div>
	);
    }
});

var Comment = React.createClass({
  render: function () {
      var commentCorps = md2html.makeHtml(this.props.children.toString());
      var idCom = "com-" + this.props.id;
      return (
	      <li className="Comment" id={idCom} >
                <strong className="CommentAuthor" >{this.props.author}</strong>
	        <p dangerouslySetInnerHTML={{__html: commentCorps}} />
	    </li>
    );
  }
});

var CommentList = React.createClass({
  render: function () {
      var commentNodes = this.props.data.map(function (com) {
	  return (
		  <Comment author={com.author} key={com.key} id={com.key} >{com.text}</Comment>
	  );
      });

      return (
	  <ul className="CommentList" >
              {commentNodes}
	  </ul>
      );
  }
});


React.render(
	<CommentBox url="src/comments.json" pollInterval={2000} />,
    document.getElementById("content")
);