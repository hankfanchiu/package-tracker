var React = require("react");
var Link = require("react-router").Link;

var Footer = React.createClass({
  render: function () {
    return (
      <footer className="footer">
        <p className="footer-links">
            <Link to="/">Home</Link>
            |
            <Link to="/about">About</Link>
            |
            <a href="https://github.com/hankfanchiu/trackmonkey"
              target="_blank">GitHub</a>
            |
            <a href="https://twitter.com/goshippo/status/699044208267517952"
              target="_blank">News</a>
        </p>

        <p className="footer-company-name">
          TrackMonkey &copy; 2016
        </p>
      </footer>
    );
  }
});

module.exports = Footer;
