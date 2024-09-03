import 'package:educational_quiz_game/features/home/questions/services/questions_services.dart';
import 'package:riverpod/riverpod.dart';
import '../data/question_model.dart';


final questionsStream = StreamProvider<List<QuestionModel>>((ref)async* {
  var data = QuestionsServices.getQuestions();
  await for (var value in data) {
    ref.read(questionsProvider.notifier).setQuestions(value);
    yield value;
  }
});

final questionsProvider = StateNotifierProvider<QuestionsProvider, List<QuestionModel>>((ref) {
  return QuestionsProvider();
});

class QuestionsProvider extends StateNotifier<List<QuestionModel>> {
  QuestionsProvider() : super([]);

  void setQuestions(List<QuestionModel> questions) {
    state = questions;
  }

}

