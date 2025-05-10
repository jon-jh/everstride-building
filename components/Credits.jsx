import "./Credits.css";

const Credits = () => {
  return (
    <div className="Credits">
      <h4>Contributors</h4>
      {/* KYLE */}
      <b>Kyle McParland</b>
      <div className="links">
        <a className="link" href="https://www.linkedin.com/in/kyle-mcparland/">
          linkedin/kyle-mcparland
        </a>
        <a className="link" href="https://github.com/kylemcparland">
          github/kylemcparland
        </a>
      </div>

      {/* JON */}
      <b>Jon Hiebert</b>
      <div className="links">
        <a
          className="link"
          href="https://www.linkedin.com/in/jonathan-h-8103b2289/"
        >
          linkedin/jonathan-dh
        </a>
        <a className="link" href="https://github.com/jon-jh">
          github/jon-jh
        </a>
      </div>

      {/* BEN */}
      <b>Ben Hallam</b>
      <div className="links">
        <a
          className="link"
          href="https://www.linkedin.com/in/benjamin-d-hallam/"
        >
          linkedin/benjamin-d-hallam
        </a>
        <a className="link" href="https://github.com/bendhallam">
          github/bendhallam
        </a>
      </div>
    </div>
  );
};

export default Credits;
