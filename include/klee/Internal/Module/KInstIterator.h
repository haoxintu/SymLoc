//===-- KInstIterator.h -----------------------------------------*- C++ -*-===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef KLEE_KINSTITERATOR_H
#define KLEE_KINSTITERATOR_H

namespace klee {
  struct KInstruction;

  class KInstIterator {
    KInstruction **it;

  public:
    //two constractors
    KInstIterator() : it(0) {}
    KInstIterator(KInstruction **_it) : it(_it) {}

    //two operator overloading used for compare two KInstIterator
    bool operator==(const KInstIterator &b) const {
      return it==b.it;
    }
    bool operator!=(const KInstIterator &b) const {
      return !(*this == b);
    }

    //also the operator overloading, just for increment reference: https://en.cppreference.com/w/cpp/language/operators/ Increment and decrement part
    KInstIterator &operator++() {
      ++it;
      return *this;
    }

    //what's this? no argument???
    operator KInstruction*() const { return it ? *it : 0;}
    operator bool() const { return it != 0; }

    KInstruction *operator ->() const { return *it; }
  };
} // End klee namespace

#endif /* KLEE_KINSTITERATOR_H */
