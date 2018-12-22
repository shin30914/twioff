import React, { Component } from "react"
import PropTypes from "prop-types"

export default class FollowButton extends Component {
  constructor(props) {
    super(props)
    this.state = {
      loading: false,
      relationship: props.relationship,
      isMatch: false
    }
  }

  follow = () => {
    this.setState({ loading: true })

    $.ajax({
      type: 'POST',
      url: `/relationships`,
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify({
        followed_id: this.props.user.id
      }),
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      }
    }).then((response) => {
      const relationship = response.relationships
      const isMatch = response.isMatch
      this.setState({
        loading: false,
        isMatch: isMatch,
        relationship})
    })
  }

  unfollow = () => {
    $.ajax({
      type: 'DELETE',
      url: `/relationships/${this.state.relationship.id}`,
      dataType: 'json',
      contentType: 'application/json',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      }
    }).then(() => {
      this.setState({
        loading: false,
        relationship: null
      })
    })
  }

  render(){
    const isFollowing = this.state.relationship !== null
    if (this.state.isMatch){
      return <button disabled={false} className={"square_btn"}>マッチ!!</button>
      } else {
      return(
        <button onClick={isFollowing ? this.unfollow : this.follow} disabled={this.state.loading}
                className={isFollowing ? "square_btn delete" : "square_btn create"}>
          {isFollowing ? "解除" : "会いたい"}
        </button>
      )
    }
  }
}

FollowButton.defaultProps = {
  relationship: null
}

FollowButton.propTypes = {
  user: PropTypes.object.isRequired,
  relationship: PropTypes.object
}