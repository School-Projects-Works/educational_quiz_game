import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionModel {
  String id;
  String subject;
  String questionType;
  final String question;
  final List<String> options;
   String answer;
  QuestionModel({
    required this.id,
    required this.subject,
    required this.questionType,
    required this.question,
    required this.options,
    required this.answer,
  });

  static QuestionModel empty() {
    return QuestionModel(
      id: '',
      subject: '',
      questionType: '',
      question: '',
      options: [],
      answer: '',
    );
  }

  QuestionModel copyWith({
    String? id,
    String? subject,
    String? questionType,
    String? question,
    List<String>? options,
    String? answer,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      questionType: questionType ?? this.questionType,
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'subject': subject});
    result.addAll({'questionType': questionType});
    result.addAll({'question': question});
    result.addAll({'options': options});
    result.addAll({'answer': answer});
    return result;
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] ?? '',
      subject: map['subject'] ?? '',
      questionType: map['questionType'] ?? '',
      question: map['question'] ?? '',
      options: List<String>.from(map['options']),
      answer: map['answer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionModel(id: $id, subject: $subject, questionType: $questionType, question: $question, options: $options, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.id == id &&
        other.subject == subject &&
        other.questionType == questionType &&
        other.question == question &&
        listEquals(other.options, options) &&
        other.answer == answer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        subject.hashCode ^
        questionType.hashCode ^
        question.hashCode ^
        options.hashCode ^
        answer.hashCode;
  }

  static List<QuestionModel> sampleQuestions = [

  {
    'id': '1',
    'subject': 'Mathematics',
    'questionType': 'MCQ',
    'question': 'What is 5 + 3?',
    'options': ['A) 6', 'B) 7', 'C) 8', 'D) 9', 'E) 10'],
    'answer': 'C'
  },
  {
    'id': '2',
    'subject': 'Mathematics',
    'questionType': 'MCQ',
    'question': 'What is the square root of 16?',
    'options': ['A) 2', 'B) 3', 'C) 4', 'D) 5', 'E) 6'],
    'answer': 'C'
  },
  {
    'id': '3',
    'subject': 'Mathematics',
    'questionType': 'fill-in',
    'question': 'Solve for x: 2x + 3 = 7',
    'options': [],
    'answer': '2'
  },
  {
    'id': '4',
    'subject': 'Mathematics',
    'questionType': 'MCQ',
    'question': 'What is 12 / 4?',
    'options': ['A) 2', 'B) 3', 'C) 4', 'D) 5', 'E) 6'],
    'answer': 'B'
  },
  {
    'id': '5',
    'subject': 'Mathematics',
    'questionType': 'fill-in',
    'question': 'Calculate the area of a square with side 5 cm.',
    'options': [],
    'answer': '25'
  },

  // English Questions
  {
    'id': '6',
    'subject': 'English',
    'questionType': 'MCQ',
    'question': 'What is the antonym of "happy"?',
    'options': ['A) Sad', 'B) Joyful', 'C) Angry', 'D) Excited', 'E) Tired'],
    'answer': 'A'
  },
  {
    'id': '7',
    'subject': 'English',
    'questionType': 'fill-in',
    'question': 'Fill in the blank: The cat is ___ the table.',
    'options': [],
    'answer': 'under'
  },
  {
    'id': '8',
    'subject': 'English',
    'questionType': 'MCQ',
    'question': 'Which of these is a noun?',
    'options': ['A) Run', 'B) Blue', 'C) Car', 'D) Quickly', 'E) Loudly'],
    'answer': 'C'
  },
  {
    'id': '9',
    'subject': 'English',
    'questionType': 'fill-in',
    'question': 'What is the past tense of "go"?',
    'options': [],
    'answer': 'went'
  },
  {
    'id': '10',
    'subject': 'English',
    'questionType': 'MCQ',
    'question': 'Which word is an adjective?',
    'options': ['A) Quickly', 'B) Loud', 'C) Dance', 'D) And', 'E) Car'],
    'answer': 'B'
  },

  // History Questions
  {
    'id': '11',
    'subject': 'History',
    'questionType': 'MCQ',
    'question': 'Who was the first President of the United States?',
    'options': ['A) Abraham Lincoln', 'B) Thomas Jefferson', 'C) George Washington', 'D) John Adams', 'E) Benjamin Franklin'],
    'answer': 'C'
  },
  {
    'id': '12',
    'subject': 'History',
    'questionType': 'fill-in',
    'question': 'In which year did World War II end?',
    'options': [],
    'answer': '1945'
  },
  {
    'id': '13',
    'subject': 'History',
    'questionType': 'MCQ',
    'question': 'Which empire was known as the "Land of the Rising Sun"?',
    'options': ['A) Roman Empire', 'B) Ottoman Empire', 'C) Japanese Empire', 'D) British Empire', 'E) Mongol Empire'],
    'answer': 'C'
  },
  {
    'id': '14',
    'subject': 'History',
    'questionType': 'fill-in',
    'question': 'Who was the first man to step on the moon?',
    'options': [],
    'answer': 'Neil Armstrong'
  },
  {
    'id': '15',
    'subject': 'History',
    'questionType': 'MCQ',
    'question': 'Which year did the Titanic sink?',
    'options': ['A) 1910', 'B) 1912', 'C) 1914', 'D) 1916', 'E) 1918'],
    'answer': 'B'
  },

  // Computing Questions
  {
    'id': '16',
    'subject': 'Computing',
    'questionType': 'MCQ',
    'question': 'Which of the following is a programming language?',
    'options': ['A) HTML', 'B) CSS', 'C) Python', 'D) SQL', 'E) XML'],
    'answer': 'C'
  },
  {
    'id': '17',
    'subject': 'Computing',
    'questionType': 'fill-in',
    'question': 'What does HTML stand for?',
    'options': [],
    'answer': 'HyperText Markup Language'
  },
  {
    'id': '18',
    'subject': 'Computing',
    'questionType': 'MCQ',
    'question': 'What is the main function of an operating system?',
    'options': ['A) To store data', 'B) To manage computer hardware', 'C) To browse the internet', 'D) To create documents', 'E) To design graphics'],
    'answer': 'B'
  },
  {
    'id': '19',
    'subject': 'Computing',
    'questionType': 'fill-in',
    'question': 'Name a popular version control system.',
    'options': [],
    'answer': 'Git'
  },
  {
    'id': '20',
    'subject': 'Computing',
    'questionType': 'MCQ',
    'question': 'Which of the following is a database management system?',
    'options': ['A) Apache', 'B) MySQL', 'C) Linux', 'D) Git', 'E) Java'],
    'answer': 'B'
  },

  // Science Questions
  {
    'id': '21',
    'subject': 'Science',
    'questionType': 'MCQ',
    'question': 'What is the chemical symbol for water?',
    'options': ['A) O', 'B) H2', 'C) H2O', 'D) HO', 'E) OH'],
    'answer': 'C'
  },
  {
    'id': '22',
    'subject': 'Science',
    'questionType': 'fill-in',
    'question': 'What planet is known as the Red Planet?',
    'options': [],
    'answer': 'Mars'
  },
  {
    'id': '23',
    'subject': 'Science',
    'questionType': 'MCQ',
    'question': 'Which gas do plants absorb from the atmosphere?',
    'options': ['A) Oxygen', 'B) Nitrogen', 'C) Carbon Dioxide', 'D) Hydrogen', 'E) Methane'],
    'answer': 'C'
  },
  {
    'id': '24',
    'subject': 'Science',
    'questionType': 'fill-in',
    'question': 'What is the center of an atom called?',
    'options': [],
    'answer': 'Nucleus'
  },
  {
    'id': '25',
    'subject': 'Science',
    'questionType': 'MCQ',
    'question': 'What is the most abundant gas in Earth’s atmosphere?',
    'options': ['A) Oxygen', 'B) Nitrogen', 'C) Carbon Dioxide', 'D) Hydrogen', 'E) Argon'],
    'answer': 'B'
  },

  // Riddles Questions
  {
    'id': '26',
    'subject': 'Riddles',
    'questionType': 'MCQ',
    'question': 'What has keys but can’t open locks?',
    'options': ['A) Piano', 'B) Map', 'C) Book', 'D) Door', 'E) Clock'],
    'answer': 'A'
  },
  {
    'id': '27',
    'subject': 'Riddles',
    'questionType': 'fill-in',
    'question': 'I speak without a mouth and hear without ears. I have no body, but I come alive with wind. What am I?',
    'options': [],
    'answer': 'Echo'
  },
  {
    'id': '28',
    'subject': 'Riddles',
    'questionType': 'MCQ',
        'question': 'What has a face and two hands but no arms or legs?',
    'options': ['A) Clock', 'B) Mirror', 'C) Coin', 'D) Book', 'E) Calendar'],
    'answer': 'A'
  },
  {
    'id': '29',
    'subject': 'Riddles',
    'questionType': 'fill-in',
    'question': 'The more you take, the more you leave behind. What am I?',
    'options': [],
    'answer': 'Footsteps'
  },
  {
    'id': '30',
    'subject': 'Riddles',
    'questionType': 'MCQ',
    'question': 'I’m tall when I’m young, and I’m short when I’m old. What am I?',
    'options': ['A) Candle', 'B) Tree', 'C) Mountain', 'D) Shadow', 'E) Pencil'],
    'answer': 'A'
  },
  // Mathematics Questions
  {
    'id': '1',
    'subject': 'Mathematics',
    'questionType': 'MCQ',
    'question': 'What is 5 + 3?',
    'options': ['A) 6', 'B) 7', 'C) 8', 'D) 9', 'E) 10'],
    'answer': 'C'
  },
  {
    'id': '2',
    'subject': 'Mathematics',
    'questionType': 'MCQ',
    'question': 'What is the square root of 16?',
    'options': ['A) 2', 'B) 3', 'C) 4', 'D) 5', 'E) 6'],
    'answer': 'C'
  },
  {
    'id': '3',
    'subject': 'Mathematics',
    'questionType': 'fill-in',
    'question': 'Solve for x: 2x + 3 = 7',
    'options': [],
    'answer': '2'
  },
  {
    'id': '4',
    'subject': 'Mathematics',
    'questionType': 'MCQ',
    'question': 'What is 12 / 4?',
    'options': ['A) 2', 'B) 3', 'C) 4', 'D) 5', 'E) 6'],
    'answer': 'B'
  },
  {
    'id': '5',
    'subject': 'Mathematics',
    'questionType': 'fill-in',
    'question': 'Calculate the area of a square with side 5 cm.',
    'options': [],
    'answer': '25'
  },
  {
    'id': '6',
    'subject': 'Mathematics',
    'questionType': 'MCQ',
    'question': 'What is the value of pi (π) up to two decimal places?',
    'options': ['A) 3.12', 'B) 3.14', 'C) 3.16', 'D) 3.18', 'E) 3.20'],
    'answer': 'B'
  },
  {
    'id': '7',
    'subject': 'Mathematics',
    'questionType': 'fill-in',
    'question': 'What is the sum of the angles in a triangle?',
    'options': [],
    'answer': '180'
  },
  {
    'id': '8',
    'subject': 'Mathematics',
    'questionType': 'MCQ',
    'question': 'What is 7 * 6?',
    'options': ['A) 36', 'B) 42', 'C) 48', 'D) 54', 'E) 56'],
    'answer': 'B'
  },
  {
    'id': '9',
    'subject': 'Mathematics',
    'questionType': 'fill-in',
    'question': 'What is the next prime number after 7?',
    'options': [],
    'answer': '11'
  },
  {
    'id': '10',
    'subject': 'Mathematics',
    'questionType': 'MCQ',
    'question': 'What is the perimeter of a rectangle with length 5 cm and width 3 cm?',
    'options': ['A) 8 cm', 'B) 10 cm', 'C) 12 cm', 'D) 14 cm', 'E) 16 cm'],
    'answer': 'D'
  },

  // English Questions
  {
    'id': '11',
    'subject': 'English',
    'questionType': 'MCQ',
    'question': 'What is the antonym of "happy"?',
    'options': ['A) Sad', 'B) Joyful', 'C) Angry', 'D) Excited', 'E) Tired'],
    'answer': 'A'
  },
  {
    'id': '12',
    'subject': 'English',
    'questionType': 'fill-in',
    'question': 'Fill in the blank: The cat is ___ the table.',
    'options': [],
    'answer': 'under'
  },
  {
    'id': '13',
    'subject': 'English',
    'questionType': 'MCQ',
    'question': 'Which of these is a noun?',
    'options': ['A) Run', 'B) Blue', 'C) Car', 'D) Quickly', 'E) Loudly'],
    'answer': 'C'
  },
  {
    'id': '14',
    'subject': 'English',
    'questionType': 'fill-in',
    'question': 'What is the past tense of "go"?',
    'options': [],
    'answer': 'went'
  },
  {
    'id': '15',
    'subject': 'English',
    'questionType': 'MCQ',
    'question': 'Which word is an adjective?',
    'options': ['A) Quickly', 'B) Loud', 'C) Dance', 'D) And', 'E) Car'],
    'answer': 'B'
  },
  {
    'id': '16',
    'subject': 'English',
    'questionType': 'fill-in',
    'question': 'What is the synonym of "large"?',
    'options': [],
    'answer': 'big'
  },
  {
    'id': '17',
    'subject': 'English',
    'questionType': 'MCQ',
    'question': 'Which sentence is correct?',
    'options': ['A) She don’t like it.', 'B) She doesn’t likes it.', 'C) She doesn’t like it.', 'D) She didn’t liked it.', 'E) She don’t likes it.'],
    'answer': 'C'
  },
  {
    'id': '18',
    'subject': 'English',
    'questionType': 'fill-in',
    'question': 'What is the plural form of "child"?',
    'options': [],
    'answer': 'children'
  },
  {
    'id': '19',
    'subject': 'English',
    'questionType': 'MCQ',
    'question': 'Which of these is a verb?',
    'options': ['A) Run', 'B) Blue', 'C) Chair', 'D) Quickly', 'E) Loud'],
    'answer': 'A'
  },
  {
    'id': '20',
    'subject': 'English',
    'questionType': 'fill-in',
    'question': 'What is the comparative form of "good"?',
    'options': [],
    'answer': 'better'
  },

  // History Questions
  {
    'id': '21',
    'subject': 'History',
    'questionType': 'MCQ',
    'question': 'Who was the first President of the United States?',
    'options': ['A) Abraham Lincoln', 'B) Thomas Jefferson', 'C) George Washington', 'D) John Adams', 'E) Benjamin Franklin'],
    'answer': 'C'
  },
  {
    'id': '22',
    'subject': 'History',
    'questionType': 'fill-in',
    'question': 'In which year did World War II end?',
    'options': [],
    'answer': '1945'
  },
  {
    'id': '23',
    'subject': 'History',
    'questionType': 'MCQ',
    'question': 'Which empire was known as the "Land of the Rising Sun"?',
    'options': ['A) Roman Empire', 'B) Ottoman Empire', 'C) Japanese Empire', 'D) British Empire', 'E) Mongol Empire'],
    'answer': 'C'
  },
  {
    'id': '24',
    'subject': 'History',
    'questionType': 'fill-in',
    'question': 'Who was the first man to step on the moon?',
    'options': [],
    'answer': 'Neil Armstrong'
  },
  {
    'id': '25',
    'subject': 'History',
    'questionType': 'MCQ',
    'question': 'Which year did the Titanic sink?',
    'options': ['A) 1910', 'B) 1912', 'C) 1914', 'D) 1916', 'E) 1918'],
    'answer': 'B'
  },
  {
    'id': '26',
    'subject': 'History',
    'questionType': 'fill-in',
    'question': 'Who was known as the Iron Lady?',
    'options': [],
    'answer': 'Margaret Thatcher'
  },
  {
    'id': '27',
    'subject': 'History',
    'questionType': 'MCQ',
    'question': 'What was the name of the ship that brought the Pilgrims to America?',
    'options': ['A) Santa Maria', 'B) Mayflower', 'C) Titanic', 'D) Pinta', 'E) Beagle'],
    'answer': 'B'
  },
  {
    'id': '28',
    'subject': 'History',
    'questionType': 'fill-in',
    'question': 'Who wrote the "I Have a Dream" speech?',
    'options': [],
    'answer': 'Martin Luther King Jr.'
  },
  
    {
      'id': '1',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is 5 + 3?',
      'options': ['A) 6', 'B) 7', 'C) 8', 'D) 9', 'E) 10'],
      'answer': 'C'
    },
    {
      'id': '2',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is the square root of 16?',
      'options': ['A) 2', 'B) 3', 'C) 4', 'D) 5', 'E) 6'],
      'answer': 'C'
    },
    {
      'id': '3',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'Solve for x: 2x + 3 = 7',
      'options': [],
      'answer': '2'
    },
    {
      'id': '4',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is 12 / 4?',
      'options': ['A) 2', 'B) 3', 'C) 4', 'D) 5', 'E) 6'],
      'answer': 'B'
    },
    {
      'id': '5',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'Calculate the area of a square with side 5 cm.',
      'options': [],
      'answer': '25'
    },
    {
      'id': '6',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is 7 x 8?',
      'options': ['A) 54', 'B) 56', 'C) 58', 'D) 60', 'E) 62'],
      'answer': 'B'
    },
    {
      'id': '7',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'What is the value of pi (π) to two decimal places?',
      'options': [],
      'answer': '3.14'
    },
    {
      'id': '8',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is 15% of 200?',
      'options': ['A) 25', 'B) 30', 'C) 35', 'D) 40', 'E) 45'],
      'answer': 'B'
    },
    {
      'id': '9',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'What is the derivative of x^2?',
      'options': [],
      'answer': '2x'
    },
    {
      'id': '10',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question':
          'What is the perimeter of a rectangle with length 10 cm and width 5 cm?',
      'options': ['A) 10 cm', 'B) 15 cm', 'C) 20 cm', 'D) 25 cm', 'E) 30 cm'],
      'answer': 'E'
    },
    {
      'id': '11',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is the sum of the angles in a triangle?',
      'options': ['A) 90°', 'B) 180°', 'C) 270°', 'D) 360°', 'E) 450°'],
      'answer': 'B'
    },
    {
      'id': '12',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'Solve for y: 3y - 9 = 0',
      'options': [],
      'answer': '3'
    },
    {
      'id': '13',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is the next number in the sequence: 2, 4, 8, 16, ?',
      'options': ['A) 20', 'B) 24', 'C) 28', 'D) 32', 'E) 36'],
      'answer': 'D'
    },
    {
      'id': '14',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is 2 to the power of 3?',
      'options': ['A) 4', 'B) 6', 'C) 8', 'D) 10', 'E) 12'],
      'answer': 'C'
    },
    {
      'id': '15',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'What is the square of 9?',
      'options': [],
      'answer': '81'
    },
    {
      'id': '16',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question':
          'If a triangle has sides of 3 cm, 4 cm, and 5 cm, what type of triangle is it?',
      'options': [
        'A) Equilateral',
        'B) Isosceles',
        'C) Right-angled',
        'D) Scalene',
        'E) Obtuse'
      ],
      'answer': 'C'
    },
    {
      'id': '17',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'What is the factorial of 5?',
      'options': [],
      'answer': '120'
    },
    {
      'id': '18',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is the mode in the data set: 1, 2, 2, 3, 4?',
      'options': ['A) 1', 'B) 2', 'C) 3', 'D) 4', 'E) None'],
      'answer': 'B'
    },
    {
      'id': '19',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'What is 100 divided by 25?',
      'options': [],
      'answer': '4'
    },
    {
      'id': '20',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is 25% of 80?',
      'options': ['A) 15', 'B) 18', 'C) 20', 'D) 22', 'E) 24'],
      'answer': 'C'
    },
    {
      'id': '21',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'Solve for z: z^2 = 49',
      'options': [],
      'answer': '7'
    },
    {
      'id': '22',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is the value of 7 + (6 × 5^2 - 4) ÷ 2?',
      'options': ['A) 67', 'B) 72', 'C) 77', 'D) 82', 'E) 87'],
      'answer': 'C'
    },
    {
      'id': '23',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question':
          'What is the circumference of a circle with a radius of 7 cm? (Use π ≈ 22/7)',
      'options': [],
      'answer': '44'
    },
    {
      'id': '24',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'If f(x) = 2x + 3, what is f(2)?',
      'options': ['A) 5', 'B) 6', 'C) 7', 'D) 8', 'E) 9'],
      'answer': 'D'
    },
    {
      'id': '25',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'What is the value of sin(90°)?',
      'options': [],
      'answer': '1'
    },
    {
      'id': '26',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is the sum of the first five prime numbers?',
      'options': ['A) 18', 'B) 20', 'C) 28', 'D) 30', 'E) 32'],
      'answer': 'D'
    },
    {
      'id': '27',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'What is the cube root of 27?',
      'options': [],
      'answer': '3'
    },
    {
      'id': '28',
      'subject': 'Mathematics',
      'questionType': 'MCQ',
      'question': 'What is the mean of the data set: 5, 10, 15, 20?',
      'options': ['A) 5', 'B) 10', 'C) 12.5', 'D) 15', 'E) 17.5'],
      'answer': 'C'
    },
    {
      'id': '29',
      'subject': 'Mathematics',
      'questionType': 'fill-in',
      'question': 'If a = 3 and b = 4, what is a^2 + b^2?',
      'options': [],
      'answer': '25'
    },
    {
      'id': '1',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which word is a synonym for "happy"?',
      'options': ['A) Sad', 'B) Joyful', 'C) Angry', 'D) Tired', 'E) Confused'],
      'answer': 'B'
    },
    {
      'id': '2',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Choose the correct form: "She ____ to the store yesterday."',
      'options': ['A) Go', 'B) Going', 'C) Gone', 'D) Went', 'E) Goes'],
      'answer': 'D'
    },
    {
      'id': '3',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'What is the antonym of "difficult"?',
      'options': [],
      'answer': 'Easy'
    },
    {
      'id': '4',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which sentence is correct?',
      'options': [
        'A) The dog chased it\'s tail.',
        'B) The dog chased its tail.',
        'C) The dog chases it\'s tail.',
        'D) The dog chase its tail.',
        'E) The dog chasing it\'s tail.'
      ],
      'answer': 'B'
    },
    {
      'id': '5',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'Complete the sentence: "He ____ the book on the table."',
      'options': [],
      'answer': 'Placed'
    },
    {
      'id': '6',
      'subject': 'English',
      'questionType': 'MCQ',
      'question':
          'Which word is an adverb in the sentence: "She sings beautifully."',
      'options': ['A) She', 'B) Sings', 'C) Beautifully', 'D) Sings', 'E) She'],
      'answer': 'C'
    },
    {
      'id': '7',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'What is the past tense of "run"?',
      'options': [],
      'answer': 'Ran'
    },
    {
      'id': '8',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'What is the plural of "child"?',
      'options': [
        'A) Childs',
        'B) Children',
        'C) Childrens',
        'D) Childes',
        'E) Childe'
      ],
      'answer': 'B'
    },
    {
      'id': '9',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'What is the comparative form of "good"?',
      'options': [],
      'answer': 'Better'
    },
    {
      'id': '10',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which of the following is a noun?',
      'options': [
        'A) Quickly',
        'B) Happiness',
        'C) Run',
        'D) Brightly',
        'E) Very'
      ],
      'answer': 'B'
    },
    {
      'id': '11',
      'subject': 'English',
      'questionType': 'MCQ',
      'question':
          'What is the main verb in the sentence: "She has been working hard."',
      'options': ['A) She', 'B) Has', 'C) Been', 'D) Working', 'E) Hard'],
      'answer': 'D'
    },
    {
      'id': '12',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'What is the opposite of "above"?',
      'options': [],
      'answer': 'Below'
    },
    {
      'id': '13',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which word is a homophone of "flower"?',
      'options': ['A) Floor', 'B) Flour', 'C) Flee', 'D) Flea', 'E) Flow'],
      'answer': 'B'
    },
    {
      'id': '14',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'What is the correct spelling?',
      'options': [
        'A) Recieve',
        'B) Receive',
        'C) Recieve',
        'D) Receeve',
        'E) Receeve'
      ],
      'answer': 'B'
    },
    {
      'id': '15',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'Which prefix can be added to "happy" to make its opposite?',
      'options': [],
      'answer': 'Un'
    },
    {
      'id': '16',
      'subject': 'English',
      'questionType': 'MCQ',
      'question':
          'What is the correct punctuation for the following sentence? "What time is it"',
      'options': [
        'A) What time is it.',
        'B) What time is it,',
        'C) What time is it!',
        'D) What time is it?',
        'E) What time is it;'
      ],
      'answer': 'D'
    },
    {
      'id': '17',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'Fill in the blank: "She is ____ than her sister."',
      'options': [],
      'answer': 'Taller'
    },
    {
      'id': '18',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which of the following is an interjection?',
      'options': ['A) Wow!', 'B) Run', 'C) House', 'D) Quickly', 'E) And'],
      'answer': 'A'
    },
    {
      'id': '19',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'Complete the sentence: "They ____ gone to the market."',
      'options': [],
      'answer': 'Have'
    },
    {
      'id': '20',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which word is a conjunction?',
      'options': ['A) Fast', 'B) But', 'C) Quickly', 'D) Red', 'E) Big'],
      'answer': 'B'
    },
    {
      'id': '21',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'What is the past tense of "think"?',
      'options': [],
      'answer': 'Thought'
    },
    {
      'id': '22',
      'subject': 'English',
      'questionType': 'MCQ',
      'question':
          'Which word is the subject in the sentence: "The cat sat on the mat."',
      'options': ['A) Cat', 'B) Sat', 'C) On', 'D) Mat', 'E) The'],
      'answer': 'A'
    },
    {
      'id': '23',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'What is the plural of "tooth"?',
      'options': [],
      'answer': 'Teeth'
    },
    {
      'id': '24',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which sentence is correct?',
      'options': [
        'A) Its raining.',
        'B) It\'s raining.',
        'C) Its raining!',
        'D) Its\' raining.',
        'E) Its raining'
      ],
      'answer': 'B'
    },
    {
      'id': '25',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'What is the opposite of "fast"?',
      'options': [],
      'answer': 'Slow'
    },
    {
      'id': '26',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which word is an adjective?',
      'options': [
        'A) Run',
        'B) Quickly',
        'C) Beautiful',
        'D) Happiness',
        'E) After'
      ],
      'answer': 'C'
    },
    {
      'id': '27',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'Complete the sentence: "She is the ____ person I know."',
      'options': [],
      'answer': 'Kindest'
    },
    {
      'id': '28',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which word is a preposition?',
      'options': [
        'A) Run',
        'B) Jump',
        'C) Over',
        'D) Beautiful',
        'E) Happiness'
      ],
      'answer': 'C'
    },
    {
      'id': '29',
      'subject': 'English',
      'questionType': 'fill-in',
      'question': 'What is the past tense of "buy"?',
      'options': [],
      'answer': 'Bought'
    },
    {
      'id': '30',
      'subject': 'English',
      'questionType': 'MCQ',
      'question': 'Which word is a pronoun?',
      'options': ['A) He', 'B) Run', 'C) Happiness', 'D) Quickly', 'E) After'],
      'answer': 'A'
    },
{
      'id': '1',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'Who was the first President of the United States?',
      'options': [
        'A) Abraham Lincoln',
        'B) George Washington',
        'C) Thomas Jefferson',
        'D) John Adams',
        'E) James Madison'
      ],
      'answer': 'B'
    },
    {
      'id': '2',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'What year did World War II end?',
      'options': ['A) 1942', 'B) 1945', 'C) 1948', 'D) 1950', 'E) 1955'],
      'answer': 'B'
    },
    {
      'id': '3',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'In what year did the Titanic sink?',
      'options': [],
      'answer': '1912'
    },
    {
      'id': '4',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'Which empire was ruled by Genghis Khan?',
      'options': [
        'A) Roman Empire',
        'B) Ottoman Empire',
        'C) Mongol Empire',
        'D) Byzantine Empire',
        'E) Persian Empire'
      ],
      'answer': 'C'
    },
    {
      'id': '5',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'Who was the British Prime Minister during World War II?',
      'options': [],
      'answer': 'Winston Churchill'
    },
    {
      'id': '6',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'Which country was the first to land a man on the moon?',
      'options': [
        'A) Soviet Union',
        'B) United States',
        'C) China',
        'D) Germany',
        'E) Japan'
      ],
      'answer': 'B'
    },
    {
      'id': '7',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'What year did the Berlin Wall fall?',
      'options': [],
      'answer': '1989'
    },
    {
      'id': '8',
      'subject': 'History',
      'questionType': 'MCQ',
      'question':
          'Who was the leader of the Soviet Union during the Cuban Missile Crisis?',
      'options': [
        'A) Vladimir Lenin',
        'B) Joseph Stalin',
        'C) Nikita Khrushchev',
        'D) Mikhail Gorbachev',
        'E) Leonid Brezhnev'
      ],
      'answer': 'C'
    },
    {
      'id': '9',
      'subject': 'History',
      'questionType': 'fill-in',
      'question':
          'Who was the first female Prime Minister of the United Kingdom?',
      'options': [],
      'answer': 'Margaret Thatcher'
    },
    {
      'id': '10',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'What year did the American Civil War begin?',
      'options': ['A) 1861', 'B) 1865', 'C) 1870', 'D) 1880', 'E) 1890'],
      'answer': 'A'
    },
    {
      'id': '11',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'Who was the Emperor of France during the Napoleonic Wars?',
      'options': [],
      'answer': 'Napoleon Bonaparte'
    },
    {
      'id': '12',
      'subject': 'History',
      'questionType': 'MCQ',
      'question':
          'Which war was fought between the North and the South regions in the United States?',
      'options': [
        'A) Revolutionary War',
        'B) World War I',
        'C) American Civil War',
        'D) War of 1812',
        'E) Mexican-American War'
      ],
      'answer': 'C'
    },
    {
      'id': '13',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'What event marked the beginning of the Great Depression?',
      'options': [],
      'answer': 'Stock Market Crash'
    },
    {
      'id': '14',
      'subject': 'History',
      'questionType': 'MCQ',
      'question':
          'Which country was responsible for the sinking of the Lusitania?',
      'options': [
        'A) Germany',
        'B) United Kingdom',
        'C) France',
        'D) Russia',
        'E) United States'
      ],
      'answer': 'A'
    },
    {
      'id': '15',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'Who discovered America in 1492?',
      'options': [],
      'answer': 'Christopher Columbus'
    },
    {
      'id': '16',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'What year did the Soviet Union collapse?',
      'options': ['A) 1989', 'B) 1990', 'C) 1991', 'D) 1992', 'E) 1993'],
      'answer': 'C'
    },
    {
      'id': '17',
      'subject': 'History',
      'questionType': 'fill-in',
      'question':
          'Who was assassinated in Sarajevo in 1914, sparking World War I?',
      'options': [],
      'answer': 'Archduke Franz Ferdinand'
    },
    {
      'id': '18',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'Which city was divided by a wall from 1961 to 1989?',
      'options': ['A) Berlin', 'B) Paris', 'C) London', 'D) Moscow', 'E) Rome'],
      'answer': 'A'
    },
    {
      'id': '19',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'Who was the first man to step on the moon?',
      'options': [],
      'answer': 'Neil Armstrong'
    },
    {
      'id': '20',
      'subject': 'History',
      'questionType': 'MCQ',
      'question':
          'What was the main reason for the United States entering World War I?',
      'options': [
        'A) Pearl Harbor attack',
        'B) Sinking of the Lusitania',
        'C) Zimmerman Telegram',
        'D) Russian Revolution',
        'E) Assassination of Archduke Franz Ferdinand'
      ],
      'answer': 'C'
    },
    {
      'id': '21',
      'subject': 'History',
      'questionType': 'fill-in',
      'question':
          'What was the name of the ship that brought the Pilgrims to America?',
      'options': [],
      'answer': 'Mayflower'
    },
    {
      'id': '22',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'Which treaty ended World War I?',
      'options': [
        'A) Treaty of Paris',
        'B) Treaty of Versailles',
        'C) Treaty of Ghent',
        'D) Treaty of Tordesillas',
        'E) Treaty of Utrecht'
      ],
      'answer': 'B'
    },
    {
      'id': '23',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'Who was the first President of the United States?',
      'options': [],
      'answer': 'George Washington'
    },
    {
      'id': '24',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'Which war was fought between 1939 and 1945?',
      'options': [
        'A) World War I',
        'B) World War II',
        'C) Korean War',
        'D) Vietnam War',
        'E) Cold War'
      ],
      'answer': 'B'
    },
    {
      'id': '25',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'Who was the British monarch during the American Revolution?',
      'options': [],
      'answer': 'King George III'
    },
    {
      'id': '26',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'What year did the American Civil Rights Movement peak?',
      'options': ['A) 1954', 'B) 1963', 'C) 1968', 'D) 1973', 'E) 1980'],
      'answer': 'B'
    },
    {
      'id': '27',
      'subject': 'History',
      'questionType': 'fill-in',
      'question': 'Who was the first Emperor of Rome?',
      'options': [],
      'answer': 'Augustus'
    },
    {
      'id': '28',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'Which ancient civilization built the pyramids?',
      'options': [
        'A) Greeks',
        'B) Romans',
        'C) Egyptians',
        'D) Persians',
        'E) Babylonians'
      ],
      'answer': 'C'
    },
    {
      'id': '29',
      'subject': 'History',
      'questionType': 'fill-in',
      'question':
          'Who led the Indian independence movement against British rule?',
      'options': [],
      'answer': 'Mahatma Gandhi'
    },
    {
      'id': '30',
      'subject': 'History',
      'questionType': 'MCQ',
      'question': 'Which revolution took place in France in 1789?',
      'options': [
        'A) Industrial Revolution',
        'B) American Revolution',
        'C) French Revolution',
        'D) Russian Revolution',
        'E) Glorious Revolution'
      ],
      'answer': 'C'
    },
    {
      'id': '5',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question': 'What does URL stand for?',
      'options': [],
      'answer': 'Uniform Resource Locator'
    },
    {
      'id': '6',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question':
          'Which protocol is used for secure communication over the internet?',
      'options': ['A) HTTP', 'B) FTP', 'C) HTTPS', 'D) SMTP', 'E) POP3'],
      'answer': 'C'
    },
    {
      'id': '7',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question': 'What is the main function of an operating system?',
      'options': [],
      'answer': 'To manage hardware and software resources'
    },
    {
      'id': '8',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question': 'Which device is used for input in a computer system?',
      'options': [
        'A) Monitor',
        'B) Printer',
        'C) Keyboard',
        'D) Speaker',
        'E) Mouse'
      ],
      'answer': 'C'
    },
    {
      'id': '9',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question': 'Name the language used for web page design.',
      'options': [],
      'answer': 'HTML'
    },
    {
      'id': '10',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question': 'What is the purpose of an algorithm?',
      'options': [
        'A) To store data',
        'B) To perform calculations',
        'C) To describe a sequence of steps to solve a problem',
        'D) To display information',
        'E) To manage user input'
      ],
      'answer': 'C'
    },
    {
      'id': '11',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question':
          'What is the name of the software that protects against viruses?',
      'options': [],
      'answer': 'Antivirus'
    },
    {
      'id': '12',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question':
          'What is the primary function of a database management system (DBMS)?',
      'options': [
        'A) To manage software installations',
        'B) To manage hardware components',
        'C) To store and retrieve data',
        'D) To handle network communications',
        'E) To process user input'
      ],
      'answer': 'C'
    },
    {
      'id': '13',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question': 'What does GUI stand for in computing?',
      'options': [],
      'answer': 'Graphical User Interface'
    },
    {
      'id': '14',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question': 'Which component is considered the brain of the computer?',
      'options': [
        'A) Hard Drive',
        'B) RAM',
        'C) CPU',
        'D) GPU',
        'E) Motherboard'
      ],
      'answer': 'C'
    },
    {
      'id': '15',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question':
          'What is the name of the programming paradigm that uses objects and classes?',
      'options': [],
      'answer': 'Object-Oriented Programming'
    },
    {
      'id': '16',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question': 'Which of the following is a non-volatile storage device?',
      'options': ['A) RAM', 'B) Cache', 'C) SSD', 'D) CPU', 'E) GPU'],
      'answer': 'C'
    },
    {
      'id': '17',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question': 'What does DNS stand for in networking?',
      'options': [],
      'answer': 'Domain Name System'
    },
    {
      'id': '18',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question': 'What is the purpose of a compiler?',
      'options': [
        'A) To run programs',
        'B) To convert source code into machine code',
        'C) To manage memory',
        'D) To execute database queries',
        'E) To handle input and output'
      ],
      'answer': 'B'
    },
    {
      'id': '19',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question':
          'What is the term for a computer program that replicates itself and spreads to other computers?',
      'options': [],
      'answer': 'Virus'
    },
    {
      'id': '20',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question':
          'Which of the following is a high-level programming language?',
      'options': [
        'A) Assembly',
        'B) C++',
        'C) Machine Code',
        'D) Binary',
        'E) HTML'
      ],
      'answer': 'B'
    },
    {
      'id': '21',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question': 'What is the main purpose of a web server?',
      'options': [],
      'answer': 'To serve web pages to clients'
    },
    {
      'id': '22',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question':
          'Which of the following is an example of an open-source operating system?',
      'options': ['A) Windows', 'B) macOS', 'C) Linux', 'D) iOS', 'E) Android'],
      'answer': 'C'
    },
    {
      'id': '23',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question':
          'What is the process of finding and fixing errors in software called?',
      'options': [],
      'answer': 'Debugging'
    },
    {
      'id': '24',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question': 'Which technology is used to create virtual machines?',
      'options': [
        'A) Docker',
        'B) Kubernetes',
        'C) VirtualBox',
        'D) Jenkins',
        'E) Ansible'
      ],
      'answer': 'C'
    },
    {
      'id': '25',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question':
          'What is the term for software that is available for free with its source code?',
      'options': [],
      'answer': 'Open Source'
    },
    {
      'id': '26',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question':
          'Which language is primarily used for web front-end development?',
      'options': ['A) JavaScript', 'B) PHP', 'C) Java', 'D) Ruby', 'E) C#'],
      'answer': 'A'
    },
    {
      'id': '27',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question':
          'What is the name of the software that translates a program written in high-level language into machine code?',
      'options': [],
      'answer': 'Compiler'
    },
    {
      'id': '28',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question':
          'Which term describes a program that manages computer hardware and software resources?',
      'options': [
        'A) Application Software',
        'B) System Software',
        'C) Middleware',
        'D) Utility Software',
        'E) Firmware'
      ],
      'answer': 'B'
    },
    {
      'id': '29',
      'subject': 'Computing',
      'questionType': 'fill-in',
      'question': 'What does HTTP stand for in web communication?',
      'options': [],
      'answer': 'Hypertext Transfer Protocol'
    },
    {
      'id': '30',
      'subject': 'Computing',
      'questionType': 'MCQ',
      'question': 'Which of the following is a type of database model?',
      'options': [
        'A) Relational',
        'B) Object-Oriented',
        'C) Document',
        'D) Key-Value',
        'E) All of the above'
      ],
      'answer': 'E'
    },
{
      'id': '1',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the chemical symbol for water?',
      'options': ['A) H2O', 'B) CO2', 'C) NaCl', 'D) O2', 'E) H2SO4'],
      'answer': 'A'
    },
    {
      'id': '2',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What planet is known as the Red Planet?',
      'options': ['A) Earth', 'B) Venus', 'C) Mars', 'D) Jupiter', 'E) Saturn'],
      'answer': 'C'
    },
    {
      'id': '3',
      'subject': 'Science',
      'questionType': 'fill-in',
      'question': 'What is the largest organ in the human body?',
      'options': [],
      'answer': 'Skin'
    },
    {
      'id': '4',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the powerhouse of the cell?',
      'options': [
        'A) Nucleus',
        'B) Mitochondria',
        'C) Ribosome',
        'D) Endoplasmic Reticulum',
        'E) Golgi Apparatus'
      ],
      'answer': 'B'
    },
    {
      'id': '5',
      'subject': 'Science',
      'questionType': 'fill-in',
      'question': 'What is the process by which plants make their food?',
      'options': [],
      'answer': 'Photosynthesis'
    },
    {
      'id': '6',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question':
          'What gas do plants absorb from the atmosphere for photosynthesis?',
      'options': [
        'A) Oxygen',
        'B) Nitrogen',
        'C) Carbon Dioxide',
        'D) Hydrogen',
        'E) Argon'
      ],
      'answer': 'C'
    },
    {
      'id': '7',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'Which planet is closest to the Sun?',
      'options': [
        'A) Venus',
        'B) Earth',
        'C) Mercury',
        'D) Mars',
        'E) Neptune'
      ],
      'answer': 'C'
    },
    {
      'id': '8',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the chemical formula for salt?',
      'options': ['A) NaCl', 'B) H2O', 'C) CO2', 'D) CH4', 'E) HCl'],
      'answer': 'A'
    },
    {
      'id': '9',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the hardest natural substance on Earth?',
      'options': [
        'A) Gold',
        'B) Iron',
        'C) Diamond',
        'D) Platinum',
        'E) Quartz'
      ],
      'answer': 'C'
    },
    {
      'id': '10',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question':
          'What type of bond is formed when electrons are shared between atoms?',
      'options': [
        'A) Ionic Bond',
        'B) Covalent Bond',
        'C) Hydrogen Bond',
        'D) Metallic Bond',
        'E) Van der Waals Bond'
      ],
      'answer': 'B'
    },
    {
      'id': '11',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the process by which a liquid turns into a gas?',
      'options': [
        'A) Condensation',
        'B) Evaporation',
        'C) Freezing',
        'D) Melting',
        'E) Sublimation'
      ],
      'answer': 'B'
    },
    {
      'id': '12',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What part of the cell contains the genetic material?',
      'options': [
        'A) Cytoplasm',
        'B) Cell Membrane',
        'C) Nucleus',
        'D) Mitochondria',
        'E) Ribosomes'
      ],
      'answer': 'C'
    },
    {
      'id': '13',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the main source of energy for the Earth?',
      'options': [
        'A) The Moon',
        'B) The Sun',
        'C) The Earth\'s Core',
        'D) Wind',
        'E) Water'
      ],
      'answer': 'B'
    },
    {
      'id': '14',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the chemical symbol for gold?',
      'options': ['A) Au', 'B) Ag', 'C) Fe', 'D) Pb', 'E) Hg'],
      'answer': 'A'
    },
    {
      'id': '15',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question':
          'Which organ in the human body is responsible for pumping blood?',
      'options': ['A) Liver', 'B) Stomach', 'C) Brain', 'D) Heart', 'E) Lungs'],
      'answer': 'D'
    },
    {
      'id': '16',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the freezing point of water in Celsius?',
      'options': ['A) 0°C', 'B) 100°C', 'C) 32°C', 'D) 50°C', 'E) -10°C'],
      'answer': 'A'
    },
    {
      'id': '17',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'Which planet is known for its rings?',
      'options': [
        'A) Jupiter',
        'B) Earth',
        'C) Saturn',
        'D) Neptune',
        'E) Uranus'
      ],
      'answer': 'C'
    },
    {
      'id': '18',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What type of rock is formed from lava?',
      'options': [
        'A) Sedimentary',
        'B) Metamorphic',
        'C) Igneous',
        'D) Marble',
        'E) Granite'
      ],
      'answer': 'C'
    },
    {
      'id': '19',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the chemical symbol for potassium?',
      'options': ['A) K', 'B) P', 'C) Pt', 'D) Po', 'E) Pr'],
      'answer': 'A'
    },
    {
      'id': '20',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the process of cell division called?',
      'options': [
        'A) Mitosis',
        'B) Meiosis',
        'C) Photosynthesis',
        'D) Respiration',
        'E) Fermentation'
      ],
      'answer': 'A'
    },
    {
      'id': '21',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'Which of these elements is a noble gas?',
      'options': [
        'A) Oxygen',
        'B) Nitrogen',
        'C) Neon',
        'D) Hydrogen',
        'E) Carbon'
      ],
      'answer': 'C'
    },
    {
      'id': '22',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the term for an organism that makes its own food?',
      'options': [
        'A) Herbivore',
        'B) Carnivore',
        'C) Producer',
        'D) Decomposer',
        'E) Omnivore'
      ],
      'answer': 'C'
    },
    {
      'id': '23',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'Which planet is known for its Great Red Spot?',
      'options': [
        'A) Earth',
        'B) Mars',
        'C) Jupiter',
        'D) Saturn',
        'E) Uranus'
      ],
      'answer': 'C'
    },
    {
      'id': '24',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question':
          'What type of bond is formed by the attraction between oppositely charged ions?',
      'options': [
        'A) Covalent Bond',
        'B) Ionic Bond',
        'C) Metallic Bond',
        'D) Hydrogen Bond',
        'E) Van der Waals Bond'
      ],
      'answer': 'B'
    },
    {
      'id': '25',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the most abundant gas in Earth\'s atmosphere?',
      'options': [
        'A) Oxygen',
        'B) Nitrogen',
        'C) Carbon Dioxide',
        'D) Argon',
        'E) Hydrogen'
      ],
      'answer': 'B'
    },
    {
      'id': '26',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the chemical symbol for iron?',
      'options': ['A) Fe', 'B) Ir', 'C) I', 'D) In', 'E) F'],
      'answer': 'A'
    },
    {
      'id': '27',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question':
          'What is the name of the process by which plants release oxygen into the atmosphere?',
      'options': [
        'A) Photosynthesis',
        'B) Respiration',
        'C) Transpiration',
        'D) Evaporation',
        'E) Condensation'
      ],
      'answer': 'A'
    },
    {
      'id': '28',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the primary function of the roots in a plant?',
      'options': [
        'A) To perform photosynthesis',
        'B) To absorb nutrients and water',
        'C) To produce flowers',
        'D) To provide support',
        'E) To release oxygen'
      ],
      'answer': 'B'
    },
    {
      'id': '29',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'Which of the following is not a planet in our solar system?',
      'options': [
        'A) Pluto',
        'B) Mars',
        'C) Titan',
        'D) Neptune',
        'E) Mercury'
      ],
      'answer': 'C'
    },
    {
      'id': '30',
      'subject': 'Science',
      'questionType': 'MCQ',
      'question': 'What is the boiling point of water in Celsius?',
      'options': ['A) 0°C', 'B) 25°C', 'C) 50°C', 'D) 75°C', 'E) 100°C'],
      'answer': 'E'
    },
{
      'id': '1',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has keys but can’t open locks?',
      'options': [
        'A) A computer',
        'B) A piano',
        'C) A map',
        'D) A diary',
        'E) A door'
      ],
      'answer': 'B'
    },
    {
      'id': '2',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What can travel around the world while staying in a corner?',
      'options': [
        'A) A stamp',
        'B) A globe',
        'C) A cloud',
        'D) A shadow',
        'E) A coin'
      ],
      'answer': 'A'
    },
    {
      'id': '3',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has a heart that doesn’t beat?',
      'options': [
        'A) A clock',
        'B) A tree',
        'C) A potato',
        'D) A book',
        'E) A car'
      ],
      'answer': 'C'
    },
    {
      'id': '4',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has a neck but no head?',
      'options': [
        'A) A bottle',
        'B) A lamp',
        'C) A sweater',
        'D) A vase',
        'E) A shirt'
      ],
      'answer': 'A'
    },
    {
      'id': '5',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question':
          'What comes once in a minute, twice in a moment, but never in a thousand years?',
      'options': [
        'A) The letter M',
        'B) The letter E',
        'C) The letter O',
        'D) The letter I',
        'E) The letter T'
      ],
      'answer': 'A'
    },
    {
      'id': '6',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has a thumb and four fingers but is not alive?',
      'options': [
        'A) A glove',
        'B) A hand',
        'C) A puppet',
        'D) A mitten',
        'E) A statue'
      ],
      'answer': 'A'
    },
    {
      'id': '7',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has to be broken before you can use it?',
      'options': [
        'A) An egg',
        'B) A promise',
        'C) A code',
        'D) A record',
        'E) A seal'
      ],
      'answer': 'A'
    },
    {
      'id': '8',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question':
          'What has cities, but no houses; forests, but no trees; and rivers, but no water?',
      'options': [
        'A) A map',
        'B) A book',
        'C) A globe',
        'D) A photograph',
        'E) A drawing'
      ],
      'answer': 'A'
    },
    {
      'id': '9',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What can be cracked, made, told, and played?',
      'options': [
        'A) A joke',
        'B) A code',
        'C) A story',
        'D) A song',
        'E) A game'
      ],
      'answer': 'A'
    },
    {
      'id': '10',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has many teeth but can’t bite?',
      'options': [
        'A) A comb',
        'B) A saw',
        'C) A zipper',
        'D) A rake',
        'E) A gear'
      ],
      'answer': 'A'
    },
    {
      'id': '11',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has one eye but can’t see?',
      'options': [
        'A) A needle',
        'B) A storm',
        'C) A camera',
        'D) A lightbulb',
        'E) A clock'
      ],
      'answer': 'A'
    },
    {
      'id': '12',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What goes up but never comes down?',
      'options': [
        'A) Age',
        'B) Smoke',
        'C) Water',
        'D) A balloon',
        'E) A rocket'
      ],
      'answer': 'A'
    },
    {
      'id': '13',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What is full of holes but still holds water?',
      'options': [
        'A) A sponge',
        'B) A bucket',
        'C) A net',
        'D) A barrel',
        'E) A cloth'
      ],
      'answer': 'A'
    },
    {
      'id': '14',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What gets wetter as it dries?',
      'options': [
        'A) A towel',
        'B) A sponge',
        'C) A mop',
        'D) A cloth',
        'E) A dish'
      ],
      'answer': 'A'
    },
    {
      'id': '15',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What can be broken but is never held?',
      'options': [
        'A) A promise',
        'B) A record',
        'C) A heart',
        'D) A glass',
        'E) A chain'
      ],
      'answer': 'A'
    },
    {
      'id': '16',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has a bed but never sleeps?',
      'options': [
        'A) A river',
        'B) A book',
        'C) A car',
        'D) A cloud',
        'E) A city'
      ],
      'answer': 'A'
    },
    {
      'id': '17',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question':
          'What begins and has no end, and is the key to a thousand doors?',
      'options': [
        'A) A circle',
        'B) A key',
        'C) A chain',
        'D) A line',
        'E) A door'
      ],
      'answer': 'A'
    },
    {
      'id': '18',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What is always in front of you but can’t be seen?',
      'options': [
        'A) The future',
        'B) The wind',
        'C) The sky',
        'D) The past',
        'E) The air'
      ],
      'answer': 'A'
    },
    {
      'id': '19',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What comes down but never goes up?',
      'options': [
        'A) Rain',
        'B) A ball',
        'C) A feather',
        'D) A leaf',
        'E) Snow'
      ],
      'answer': 'A'
    },
    {
      'id': '20',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What is always coming but never arrives?',
      'options': [
        'A) Tomorrow',
        'B) A train',
        'C) A package',
        'D) A letter',
        'E) A bus'
      ],
      'answer': 'A'
    },
    {
      'id': '21',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has a face and two hands but no arms or legs?',
      'options': [
        'A) A clock',
        'B) A mirror',
        'C) A doll',
        'D) A painting',
        'E) A photograph'
      ],
      'answer': 'A'
    },
    {
      'id': '22',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What can be caught but not thrown?',
      'options': [
        'A) A cold',
        'B) A ball',
        'C) A fish',
        'D) A bird',
        'E) A wave'
      ],
      'answer': 'A'
    },
    {
      'id': '23',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has a ring but no finger?',
      'options': [
        'A) A phone',
        'B) A bell',
        'C) A tree',
        'D) A coin',
        'E) A bracelet'
      ],
      'answer': 'B'
    },
    {
      'id': '24',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What is so fragile that saying its name breaks it?',
      'options': [
        'A) Silence',
        'B) A glass',
        'C) A bubble',
        'D) A promise',
        'E) A secret'
      ],
      'answer': 'A'
    },
    {
      'id': '25',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has many keys but can’t open a single door?',
      'options': [
        'A) A piano',
        'B) A map',
        'C) A safe',
        'D) A locker',
        'E) A computer'
      ],
      'answer': 'A'
    },
    {
      'id': '26',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What is full of holes but still holds water?',
      'options': [
        'A) A sponge',
        'B) A net',
        'C) A sieve',
        'D) A bucket',
        'E) A container'
      ],
      'answer': 'A'
    },
    {
      'id': '27',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What has a head, a tail, but no body?',
      'options': [
        'A) A coin',
        'B) A snake',
        'C) A rope',
        'D) A shirt',
        'E) A pen'
      ],
      'answer': 'A'
    },
    {
      'id': '28',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What can be cracked, made, told, and played?',
      'options': [
        'A) A joke',
        'B) A code',
        'C) A story',
        'D) A song',
        'E) A game'
      ],
      'answer': 'A'
    },
    {
      'id': '29',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What is always in front of you but can’t be seen?',
      'options': [
        'A) The future',
        'B) The wind',
        'C) The sky',
        'D) The past',
        'E) The air'
      ],
      'answer': 'A'
    },
    {
      'id': '30',
      'subject': 'Riddles',
      'questionType': 'MCQ',
      'question': 'What comes down but never goes up?',
      'options': [
        'A) Rain',
        'B) A ball',
        'C) A feather',
        'D) A leaf',
        'E) Snow'
      ],
      'answer': 'A'
    },



  ].map((e) => QuestionModel.fromMap(e)).toList();
}
