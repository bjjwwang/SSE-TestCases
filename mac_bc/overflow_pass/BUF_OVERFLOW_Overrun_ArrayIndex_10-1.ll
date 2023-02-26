; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_10-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_10-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.myStruct = type { [6 x i32] }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca %struct.myStruct, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.myStruct* %s1, metadata !15, metadata !DIExpression()), !dbg !22
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !23
  call void @srand(i32 noundef %call), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %a, metadata !25, metadata !DIExpression()), !dbg !26
  %call1 = call i32 @rand(), !dbg !27
  %rem = srem i32 %call1, 100, !dbg !28
  store i32 %rem, i32* %a, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %b, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 1, i32* %b, align 4, !dbg !30
  %call2 = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %a), !dbg !31
  %0 = load i32, i32* %a, align 4, !dbg !32
  %1 = load i32, i32* %b, align 4, !dbg !33
  %add = add nsw i32 %0, %1, !dbg !34
  store i32 %add, i32* %b, align 4, !dbg !35
  %2 = load i32, i32* %a, align 4, !dbg !36
  %cmp = icmp sgt i32 %2, 5, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %f1 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %s1, i32 0, i32 0, !dbg !40
  %3 = load i32, i32* %b, align 4, !dbg !42
  %idxprom = sext i32 %3 to i64, !dbg !43
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* %f1, i64 0, i64 %idxprom, !dbg !43
  store i32 1, i32* %arrayidx, align 4, !dbg !44
  br label %if.end, !dbg !45

if.else:                                          ; preds = %entry
  %f13 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %s1, i32 0, i32 0, !dbg !46
  %4 = load i32, i32* %b, align 4, !dbg !48
  %idxprom4 = sext i32 %4 to i64, !dbg !49
  %arrayidx5 = getelementptr inbounds [6 x i32], [6 x i32]* %f13, i64 0, i64 %idxprom4, !dbg !49
  store i32 1, i32* %arrayidx5, align 4, !dbg !50
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !51
  ret i32 %5, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

declare i32 @scanf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 11, type: !11, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "s1", scope: !9, file: !10, line: 12, type: !16)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "myStruct", file: !10, line: 7, size: 192, elements: !17)
!17 = !{!18}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "f1", scope: !16, file: !10, line: 8, baseType: !19, size: 192)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 192, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 6)
!22 = !DILocation(line: 12, column: 21, scope: !9)
!23 = !DILocation(line: 13, column: 8, scope: !9)
!24 = !DILocation(line: 13, column: 2, scope: !9)
!25 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 14, type: !13)
!26 = !DILocation(line: 14, column: 9, scope: !9)
!27 = !DILocation(line: 14, column: 13, scope: !9)
!28 = !DILocation(line: 14, column: 20, scope: !9)
!29 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 15, type: !13)
!30 = !DILocation(line: 15, column: 9, scope: !9)
!31 = !DILocation(line: 16, column: 5, scope: !9)
!32 = !DILocation(line: 17, column: 9, scope: !9)
!33 = !DILocation(line: 17, column: 13, scope: !9)
!34 = !DILocation(line: 17, column: 11, scope: !9)
!35 = !DILocation(line: 17, column: 7, scope: !9)
!36 = !DILocation(line: 18, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !9, file: !10, line: 18, column: 9)
!38 = !DILocation(line: 18, column: 11, scope: !37)
!39 = !DILocation(line: 18, column: 9, scope: !9)
!40 = !DILocation(line: 19, column: 12, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 18, column: 16)
!42 = !DILocation(line: 19, column: 15, scope: !41)
!43 = !DILocation(line: 19, column: 9, scope: !41)
!44 = !DILocation(line: 19, column: 18, scope: !41)
!45 = !DILocation(line: 20, column: 5, scope: !41)
!46 = !DILocation(line: 22, column: 12, scope: !47)
!47 = distinct !DILexicalBlock(scope: !37, file: !10, line: 21, column: 10)
!48 = !DILocation(line: 22, column: 15, scope: !47)
!49 = !DILocation(line: 22, column: 9, scope: !47)
!50 = !DILocation(line: 22, column: 18, scope: !47)
!51 = !DILocation(line: 24, column: 1, scope: !9)
