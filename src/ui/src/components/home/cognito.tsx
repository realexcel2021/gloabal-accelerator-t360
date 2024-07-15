import {Amplify, Auth} from "aws-amplify";
import React, { useEffect } from "react";
import {useSelector} from "react-redux";
import {useHistory} from "react-router-dom";
import {ReduxRoot} from "../../interfaces";

function Cognito (props: any) {

  const history = useHistory();

  const amplifyConfig = {
    Auth: {
      mandatorySignIn: true,
      region: 'us-east-1',
      userPoolId: 'us-east-1_E13sUdlcz', // USER_POOL_ID_PLACEHOLDER
      identityPoolId: 'us-east-1:f472ccb2-1af2-471d-bcad-7ef647b453dc', // IDENTITY_POOL_ID_PLACEHOLDER
      userPoolWebClientId: '6s4e6j735hm815koridfise9ul', // WEB_CLIENT_ID_PLACEHOLDER
      oauth: {
        domain: 'crf-remittance-terraform.auth.us-east-1.amazoncognito.com',
        redirectSignIn: 'http://d2tpe2fwn22jm8.cloudfront.net',
        redirectSignOut: 'http://d2tpe2fwn22jm8.cloudfront.net',
        responseType: 'code' // or 'token', note that REFRESH token will only be generated when the responseType is code
      }
    }
  };

  Amplify.configure(amplifyConfig);
  Auth.configure(amplifyConfig);

  const token = useSelector( (state:ReduxRoot) => {
    return state.reducerState.token
  });

  useEffect(() => {

    if (token === "") {
      history.push("/Login");
    }

  }, [history, token]);

  return (
      <div />
  );
}

export default Cognito;