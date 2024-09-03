import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_quiz_game/features/home/questions/data/question_model.dart';

class QuestionsServices {

 static  CollectionReference questions = FirebaseFirestore.instance.collection('questions');

static String questionId(){
  return questions.doc().id;
}
  static Future<bool> createQuestion({required QuestionModel question}) async {
    try {
      await questions.doc(question.id).set(question.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Stream<List<QuestionModel>> getQuestions(){
    return questions.snapshots().map((snapshot) => snapshot.docs.map((doc) => QuestionModel.fromMap(doc.data() as Map<String,dynamic>)).toList());
  }
}