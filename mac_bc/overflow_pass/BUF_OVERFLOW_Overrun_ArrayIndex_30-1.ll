; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_30-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_30-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.testStruct = type { i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [6 x i32], align 16
  %i = alloca %struct.testStruct*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [6 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %struct.testStruct** %i, metadata !20, metadata !DIExpression()), !dbg !25
  %call = call i8* @malloc(i64 noundef 16) #4, !dbg !26
  %0 = bitcast i8* %call to %struct.testStruct*, !dbg !26
  store %struct.testStruct* %0, %struct.testStruct** %i, align 8, !dbg !25
  %call1 = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !27
  call void @srand(i32 noundef %call1), !dbg !28
  %call2 = call i32 @rand(), !dbg !29
  %rem = srem i32 %call2, 10, !dbg !30
  %1 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !31
  %arrayidx = getelementptr inbounds %struct.testStruct, %struct.testStruct* %1, i64 3, !dbg !31
  %a = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx, i32 0, i32 0, !dbg !32
  store i32 %rem, i32* %a, align 4, !dbg !33
  %2 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !34
  %arrayidx3 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %2, i64 3, !dbg !34
  %a4 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx3, i32 0, i32 0, !dbg !36
  %3 = load i32, i32* %a4, align 4, !dbg !36
  %cmp = icmp sgt i32 %3, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %4 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !39
  %arrayidx5 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %4, i64 3, !dbg !39
  %a6 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx5, i32 0, i32 0, !dbg !41
  %5 = load i32, i32* %a6, align 4, !dbg !41
  %idxprom = sext i32 %5 to i64, !dbg !42
  %arrayidx7 = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !42
  store i32 1, i32* %arrayidx7, align 4, !dbg !43
  br label %if.end16, !dbg !44

if.else:                                          ; preds = %entry
  %6 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !45
  %arrayidx8 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %6, i64 3, !dbg !45
  %a9 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx8, i32 0, i32 0, !dbg !47
  %7 = load i32, i32* %a9, align 4, !dbg !47
  %cmp10 = icmp sge i32 %7, 0, !dbg !48
  br i1 %cmp10, label %if.then11, label %if.end, !dbg !49

if.then11:                                        ; preds = %if.else
  %8 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !50
  %arrayidx12 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %8, i64 3, !dbg !50
  %a13 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx12, i32 0, i32 0, !dbg !52
  %9 = load i32, i32* %a13, align 4, !dbg !52
  %idxprom14 = sext i32 %9 to i64, !dbg !53
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 %idxprom14, !dbg !53
  store i32 1, i32* %arrayidx15, align 4, !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then11, %if.else
  br label %if.end16

if.end16:                                         ; preds = %if.end, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !56
  ret i32 %10, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

declare void @srand(i32 noundef) #3

declare i32 @time(...) #3

declare i32 @rand() #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_30-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 11, type: !11, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_30-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 12, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 192, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 6)
!19 = !DILocation(line: 12, column: 6, scope: !9)
!20 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 13, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "testStruct", file: !10, line: 7, size: 32, elements: !23)
!23 = !{!24}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !22, file: !10, line: 8, baseType: !13, size: 32)
!25 = !DILocation(line: 13, column: 21, scope: !9)
!26 = !DILocation(line: 13, column: 25, scope: !9)
!27 = !DILocation(line: 14, column: 8, scope: !9)
!28 = !DILocation(line: 14, column: 2, scope: !9)
!29 = !DILocation(line: 15, column: 11, scope: !9)
!30 = !DILocation(line: 15, column: 18, scope: !9)
!31 = !DILocation(line: 15, column: 2, scope: !9)
!32 = !DILocation(line: 15, column: 7, scope: !9)
!33 = !DILocation(line: 15, column: 9, scope: !9)
!34 = !DILocation(line: 17, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !9, file: !10, line: 17, column: 9)
!36 = !DILocation(line: 17, column: 14, scope: !35)
!37 = !DILocation(line: 17, column: 16, scope: !35)
!38 = !DILocation(line: 17, column: 9, scope: !9)
!39 = !DILocation(line: 18, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !35, file: !10, line: 17, column: 21)
!41 = !DILocation(line: 18, column: 21, scope: !40)
!42 = !DILocation(line: 18, column: 9, scope: !40)
!43 = !DILocation(line: 18, column: 24, scope: !40)
!44 = !DILocation(line: 19, column: 5, scope: !40)
!45 = !DILocation(line: 20, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !10, line: 20, column: 13)
!47 = !DILocation(line: 20, column: 18, scope: !46)
!48 = !DILocation(line: 20, column: 20, scope: !46)
!49 = !DILocation(line: 20, column: 13, scope: !35)
!50 = !DILocation(line: 21, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !10, line: 20, column: 26)
!52 = !DILocation(line: 21, column: 21, scope: !51)
!53 = !DILocation(line: 21, column: 9, scope: !51)
!54 = !DILocation(line: 21, column: 24, scope: !51)
!55 = !DILocation(line: 22, column: 5, scope: !51)
!56 = !DILocation(line: 23, column: 1, scope: !9)
