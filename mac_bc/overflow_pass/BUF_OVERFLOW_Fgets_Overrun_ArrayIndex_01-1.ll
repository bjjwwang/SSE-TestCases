; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Fgets_Overrun_ArrayIndex_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Fgets_Overrun_ArrayIndex_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [5 x i8] c"1234\00", align 1
@__stdinp = external global %struct.__sFILE*, align 8

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @checkPassword() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %realPassword = alloca i8*, align 8
  %givenPassword = alloca [10 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %realPassword, metadata !15, metadata !DIExpression()), !dbg !18
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8** %realPassword, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %givenPassword, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %givenPassword, i64 0, i64 0, !dbg !24
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !25
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 12, %struct.__sFILE* noundef %0), !dbg !26
  %arraydecay1 = getelementptr inbounds [10 x i8], [10 x i8]* %givenPassword, i64 0, i64 0, !dbg !27
  %1 = load i8*, i8** %realPassword, align 8, !dbg !29
  %call2 = call i32 @strncmp(i8* noundef %arraydecay1, i8* noundef %1, i64 noundef 4), !dbg !30
  %tobool = icmp ne i32 %call2, 0, !dbg !30
  br i1 %tobool, label %if.end, label %if.then, !dbg !31

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !32
  br label %return, !dbg !32

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !34
  br label %return, !dbg !34

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !35
  ret i32 %2, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @fgets(i8* noundef, i32 noundef, %struct.__sFILE* noundef) #2

declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !36 {
entry:
  %call = call i32 @checkPassword(), !dbg !37
  ret i32 0, !dbg !38
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Fgets_Overrun_ArrayIndex_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "checkPassword", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Fgets_Overrun_ArrayIndex_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "realPassword", scope: !9, file: !10, line: 8, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 8, column: 11, scope: !9)
!19 = !DILocalVariable(name: "givenPassword", scope: !9, file: !10, line: 9, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 9, column: 7, scope: !9)
!24 = !DILocation(line: 10, column: 8, scope: !9)
!25 = !DILocation(line: 10, column: 27, scope: !9)
!26 = !DILocation(line: 10, column: 2, scope: !9)
!27 = !DILocation(line: 11, column: 18, scope: !28)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 9)
!29 = !DILocation(line: 11, column: 33, scope: !28)
!30 = !DILocation(line: 11, column: 10, scope: !28)
!31 = !DILocation(line: 11, column: 9, scope: !9)
!32 = !DILocation(line: 12, column: 3, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !10, line: 11, column: 51)
!34 = !DILocation(line: 14, column: 2, scope: !9)
!35 = !DILocation(line: 15, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !11, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!37 = !DILocation(line: 18, column: 5, scope: !36)
!38 = !DILocation(line: 19, column: 1, scope: !36)
