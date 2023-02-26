; ModuleID = 'linux_bc/pass/BASIC_nullptr_def_0.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_nullptr_def_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !18 {
entry:
  %retval = alloca i32, align 4
  %twoIntsStructPointer = alloca %struct._twoIntsStruct*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 8, align 16, !dbg !23
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !24
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !22
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !25
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !26
  store i32 5, i32* %intOne, align 4, !dbg !27
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !28
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !29
  store i32 3, i32* %intTwo, align 4, !dbg !30
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !31
  %intTwo1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !33
  %5 = load i32, i32* %intTwo1, align 4, !dbg !33
  %cmp = icmp slt i32 %5, 0, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !36
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !39
  %intTwo2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i32 0, i32 1, !dbg !40
  %7 = load i32, i32* %intTwo2, align 4, !dbg !40
  %cmp3 = icmp eq i32 %7, 3, !dbg !41
  %conv = zext i1 %cmp3 to i32, !dbg !41
  %call = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 %conv), !dbg !42
  ret i32 0, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @svf_assert(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_nullptr_def_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 18, baseType: !7)
!6 = !DIFile(filename: "src/pass/BASIC_nullptr_def_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 15, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 16, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 17, baseType: !10, size: 32, offset: 32)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 20, type: !19, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!10}
!21 = !DILocalVariable(name: "twoIntsStructPointer", scope: !18, file: !6, line: 21, type: !4)
!22 = !DILocation(line: 21, column: 18, scope: !18)
!23 = !DILocation(line: 21, column: 59, scope: !18)
!24 = !DILocation(line: 21, column: 41, scope: !18)
!25 = !DILocation(line: 22, column: 2, scope: !18)
!26 = !DILocation(line: 22, column: 24, scope: !18)
!27 = !DILocation(line: 22, column: 31, scope: !18)
!28 = !DILocation(line: 23, column: 5, scope: !18)
!29 = !DILocation(line: 23, column: 27, scope: !18)
!30 = !DILocation(line: 23, column: 34, scope: !18)
!31 = !DILocation(line: 24, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !6, line: 24, column: 9)
!33 = !DILocation(line: 24, column: 31, scope: !32)
!34 = !DILocation(line: 24, column: 38, scope: !32)
!35 = !DILocation(line: 24, column: 9, scope: !18)
!36 = !DILocation(line: 25, column: 30, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !6, line: 24, column: 43)
!38 = !DILocation(line: 26, column: 5, scope: !37)
!39 = !DILocation(line: 27, column: 13, scope: !18)
!40 = !DILocation(line: 27, column: 35, scope: !18)
!41 = !DILocation(line: 27, column: 42, scope: !18)
!42 = !DILocation(line: 27, column: 2, scope: !18)
!43 = !DILocation(line: 29, column: 2, scope: !18)
