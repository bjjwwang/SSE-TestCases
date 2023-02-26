; ModuleID = 'mac_bc/pass/BASIC_nullptr_def_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_nullptr_def_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !18 {
entry:
  %retval = alloca i32, align 4
  %twoIntsStructPointer = alloca %struct._twoIntsStruct*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 8, align 16, !dbg !24
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !25
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !23
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !26
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !27
  store i32 5, i32* %intOne, align 4, !dbg !28
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !29
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !30
  store i32 3, i32* %intTwo, align 4, !dbg !31
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !32
  %intTwo1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !34
  %5 = load i32, i32* %intTwo1, align 4, !dbg !34
  %cmp = icmp slt i32 %5, 0, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !37
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !40
  %intTwo2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i32 0, i32 1, !dbg !41
  %7 = load i32, i32* %intTwo2, align 4, !dbg !41
  %cmp3 = icmp eq i32 %7, 3, !dbg !42
  %conv = zext i1 %cmp3 to i32, !dbg !42
  %call = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 noundef %conv), !dbg !43
  ret i32 0, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @svf_assert(...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_nullptr_def_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !5, line: 18, baseType: !6)
!5 = !DIFile(filename: "src/pass/BASIC_nullptr_def_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !5, line: 15, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !6, file: !5, line: 16, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !6, file: !5, line: 17, baseType: !9, size: 32, offset: 32)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 20, type: !19, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{!9}
!21 = !{}
!22 = !DILocalVariable(name: "twoIntsStructPointer", scope: !18, file: !5, line: 21, type: !3)
!23 = !DILocation(line: 21, column: 18, scope: !18)
!24 = !DILocation(line: 21, column: 59, scope: !18)
!25 = !DILocation(line: 21, column: 41, scope: !18)
!26 = !DILocation(line: 22, column: 2, scope: !18)
!27 = !DILocation(line: 22, column: 24, scope: !18)
!28 = !DILocation(line: 22, column: 31, scope: !18)
!29 = !DILocation(line: 23, column: 5, scope: !18)
!30 = !DILocation(line: 23, column: 27, scope: !18)
!31 = !DILocation(line: 23, column: 34, scope: !18)
!32 = !DILocation(line: 24, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !5, line: 24, column: 9)
!34 = !DILocation(line: 24, column: 31, scope: !33)
!35 = !DILocation(line: 24, column: 38, scope: !33)
!36 = !DILocation(line: 24, column: 9, scope: !18)
!37 = !DILocation(line: 25, column: 30, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !5, line: 24, column: 43)
!39 = !DILocation(line: 26, column: 5, scope: !38)
!40 = !DILocation(line: 27, column: 13, scope: !18)
!41 = !DILocation(line: 27, column: 35, scope: !18)
!42 = !DILocation(line: 27, column: 42, scope: !18)
!43 = !DILocation(line: 27, column: 2, scope: !18)
!44 = !DILocation(line: 29, column: 2, scope: !18)
