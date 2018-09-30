import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

const db = admin.firestore();

export const allMatches = functions.https.onRequest(async (req, res) => {
  return db
    .collection('matches')
    .orderBy('timestamp', 'desc')
    .get()
    .then(snapshot => {
      let matches = [];
      snapshot.forEach(match => (matches = matches.concat(match.data())));
      res.send(matches);
    });
});

export const reportMatch = functions.https.onRequest(async (req, res) => {
  const now = Date.now();
  const { winner, loser } = req.body;
  return db
    .collection('matches')
    .add({
      winner,
      loser,
      timestamp: now,
    })
    .then(match => {
      res.redirect(303, match.path.toString());
    });
});
