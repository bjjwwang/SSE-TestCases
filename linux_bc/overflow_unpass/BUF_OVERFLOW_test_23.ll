; ModuleID = 'linux_bc/overflow_unpass/BUF_OVERFLOW_test_23.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_23.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%3s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"abc\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [4 x i8], align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i8]* %buffer, metadata !14, metadata !DIExpression()), !dbg !19
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %buffer, i64 0, i64 0, !dbg !20
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %arraydecay), !dbg !21
  %arraydecay1 = getelementptr inbounds [4 x i8], [4 x i8]* %buffer, i64 0, i64 0, !dbg !22
  %call2 = call i32 @strcmp(i8* %arraydecay1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !24
  %tobool = icmp ne i32 %call2, 0, !dbg !24
  br i1 %tobool, label %if.end, label %if.then, !dbg !25

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %buffer, i64 0, i64 4, !dbg !26
  store i8 97, i8* %arrayidx, align 1, !dbg !28
  br label %if.end, !dbg !29

if.end:                                           ; preds = %if.then, %entry
  %0 = load i32, i32* %retval, align 4, !dbg !30
  ret i32 %0, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @strcmp(i8*, i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_23.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_23.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 32, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 4)
!19 = !DILocation(line: 8, column: 10, scope: !9)
!20 = !DILocation(line: 9, column: 18, scope: !9)
!21 = !DILocation(line: 9, column: 5, scope: !9)
!22 = !DILocation(line: 10, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 8)
!24 = !DILocation(line: 10, column: 9, scope: !23)
!25 = !DILocation(line: 10, column: 8, scope: !9)
!26 = !DILocation(line: 11, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !10, line: 10, column: 32)
!28 = !DILocation(line: 11, column: 19, scope: !27)
!29 = !DILocation(line: 12, column: 5, scope: !27)
!30 = !DILocation(line: 13, column: 1, scope: !9)
