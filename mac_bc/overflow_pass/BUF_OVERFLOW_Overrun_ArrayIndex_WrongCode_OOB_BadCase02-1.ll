; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCode_OOB_BadCase02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCode_OOB_BadCase02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@value = global i32 0, align 4, !dbg !0
@__const.main.array = private unnamed_addr constant [12 x i32] [i32 1, i32 2, i32 3, i32 2, i32 4, i32 22, i32 44, i32 123, i32 443, i32 12, i32 55, i32 43], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca [12 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [12 x i32]* %array, metadata !20, metadata !DIExpression()), !dbg !24
  %0 = bitcast [12 x i32]* %array to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([12 x i32]* @__const.main.array to i8*), i64 48, i1 false), !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !28
  %conv = sext i32 %1 to i64, !dbg !28
  %cmp = icmp ult i64 %conv, 12, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !32
  %idxprom = sext i32 %2 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [12 x i32], [12 x i32]* %array, i64 0, i64 %idxprom, !dbg !35
  %3 = load i32, i32* %arrayidx, align 4, !dbg !35
  %4 = load i32, i32* @value, align 4, !dbg !36
  %cmp2 = icmp slt i32 %3, %4, !dbg !37
  br i1 %cmp2, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !39

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %5, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %if.then, %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !47
  %idxprom4 = sext i32 %6 to i64, !dbg !48
  %arrayidx5 = getelementptr inbounds [12 x i32], [12 x i32]* %array, i64 0, i64 %idxprom4, !dbg !48
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !48
  ret i32 %7, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "value", scope: !2, file: !5, line: 27, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCode_OOB_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCode_OOB_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6}
!17 = !{}
!18 = !DILocalVariable(name: "i", scope: !14, file: !5, line: 30, type: !6)
!19 = !DILocation(line: 30, column: 9, scope: !14)
!20 = !DILocalVariable(name: "array", scope: !14, file: !5, line: 31, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 384, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 12)
!24 = !DILocation(line: 31, column: 10, scope: !14)
!25 = !DILocation(line: 32, column: 12, scope: !26)
!26 = distinct !DILexicalBlock(scope: !14, file: !5, line: 32, column: 5)
!27 = !DILocation(line: 32, column: 10, scope: !26)
!28 = !DILocation(line: 32, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !5, line: 32, column: 5)
!30 = !DILocation(line: 32, column: 19, scope: !29)
!31 = !DILocation(line: 32, column: 5, scope: !26)
!32 = !DILocation(line: 33, column: 19, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !5, line: 33, column: 13)
!34 = distinct !DILexicalBlock(scope: !29, file: !5, line: 32, column: 55)
!35 = !DILocation(line: 33, column: 13, scope: !33)
!36 = !DILocation(line: 33, column: 24, scope: !33)
!37 = !DILocation(line: 33, column: 22, scope: !33)
!38 = !DILocation(line: 33, column: 13, scope: !34)
!39 = !DILocation(line: 34, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !5, line: 33, column: 31)
!41 = !DILocation(line: 36, column: 5, scope: !34)
!42 = !DILocation(line: 32, column: 51, scope: !29)
!43 = !DILocation(line: 32, column: 5, scope: !29)
!44 = distinct !{!44, !31, !45, !46}
!45 = !DILocation(line: 36, column: 5, scope: !26)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocation(line: 38, column: 18, scope: !14)
!48 = !DILocation(line: 38, column: 12, scope: !14)
!49 = !DILocation(line: 38, column: 5, scope: !14)
