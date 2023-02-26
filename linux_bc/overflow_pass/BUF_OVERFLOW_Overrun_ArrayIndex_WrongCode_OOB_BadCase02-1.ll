; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCode_OOB_BadCase02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCode_OOB_BadCase02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@value = dso_local global i32 0, align 4, !dbg !0
@__const.main.array = private unnamed_addr constant [12 x i32] [i32 1, i32 2, i32 3, i32 2, i32 4, i32 22, i32 44, i32 123, i32 443, i32 12, i32 55, i32 43], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca [12 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [12 x i32]* %array, metadata !19, metadata !DIExpression()), !dbg !23
  %0 = bitcast [12 x i32]* %array to i8*, !dbg !23
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([12 x i32]* @__const.main.array to i8*), i64 48, i1 false), !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !27
  %conv = sext i32 %1 to i64, !dbg !27
  %cmp = icmp ult i64 %conv, 12, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !31
  %idxprom = sext i32 %2 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [12 x i32], [12 x i32]* %array, i64 0, i64 %idxprom, !dbg !34
  %3 = load i32, i32* %arrayidx, align 4, !dbg !34
  %4 = load i32, i32* @value, align 4, !dbg !35
  %cmp2 = icmp slt i32 %3, %4, !dbg !36
  br i1 %cmp2, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !38

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %5, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %if.then, %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !46
  %idxprom4 = sext i32 %6 to i64, !dbg !47
  %arrayidx5 = getelementptr inbounds [12 x i32], [12 x i32]* %array, i64 0, i64 %idxprom4, !dbg !47
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !47
  ret i32 %7, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "value", scope: !2, file: !6, line: 27, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCode_OOB_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCode_OOB_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7}
!17 = !DILocalVariable(name: "i", scope: !14, file: !6, line: 30, type: !7)
!18 = !DILocation(line: 30, column: 9, scope: !14)
!19 = !DILocalVariable(name: "array", scope: !14, file: !6, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 384, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 12)
!23 = !DILocation(line: 31, column: 10, scope: !14)
!24 = !DILocation(line: 32, column: 12, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !6, line: 32, column: 5)
!26 = !DILocation(line: 32, column: 10, scope: !25)
!27 = !DILocation(line: 32, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !6, line: 32, column: 5)
!29 = !DILocation(line: 32, column: 19, scope: !28)
!30 = !DILocation(line: 32, column: 5, scope: !25)
!31 = !DILocation(line: 33, column: 19, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !6, line: 33, column: 13)
!33 = distinct !DILexicalBlock(scope: !28, file: !6, line: 32, column: 55)
!34 = !DILocation(line: 33, column: 13, scope: !32)
!35 = !DILocation(line: 33, column: 24, scope: !32)
!36 = !DILocation(line: 33, column: 22, scope: !32)
!37 = !DILocation(line: 33, column: 13, scope: !33)
!38 = !DILocation(line: 34, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !6, line: 33, column: 31)
!40 = !DILocation(line: 36, column: 5, scope: !33)
!41 = !DILocation(line: 32, column: 51, scope: !28)
!42 = !DILocation(line: 32, column: 5, scope: !28)
!43 = distinct !{!43, !30, !44, !45}
!44 = !DILocation(line: 36, column: 5, scope: !25)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocation(line: 38, column: 18, scope: !14)
!47 = !DILocation(line: 38, column: 12, scope: !14)
!48 = !DILocation(line: 38, column: 5, scope: !14)
