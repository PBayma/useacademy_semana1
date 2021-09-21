import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckboxContainer extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool selecionado;
  final bool resposta;
  final bool verdade;
  const CustomCheckboxContainer({
    Key? key,
    this.onTap,
    required this.text,
    this.selecionado = false,
    this.resposta = false,
    this.verdade = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: !selecionado
                    ? const Color.fromRGBO(227, 227, 227, 1)
                    : !resposta
                        ? const Color.fromRGBO(117, 140, 255, 1)
                        : verdade
                            ? const Color.fromRGBO(56, 197, 61, 1)
                            : const Color.fromRGBO(255, 90, 90, 1),
              ),
              borderRadius: BorderRadius.circular(16),
              color: !selecionado
                  ? Colors.white
                  : !resposta
                      ? const Color.fromRGBO(229, 233, 255, 1)
                      : verdade
                          ? const Color.fromRGBO(229, 255, 230, 1)
                          : const Color.fromRGBO(255, 214, 214, 1),
            ),
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  !selecionado
                      ? Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(117, 140, 255, 1),
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                        )
                      : !resposta
                          ? Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(117, 140, 255, 1),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            )
                          : verdade
                              ? Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.green,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.red,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                  const SizedBox(width: 12),
                  Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
