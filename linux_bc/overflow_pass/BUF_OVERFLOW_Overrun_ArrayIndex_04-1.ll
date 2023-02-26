; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_04-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_04-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.input = private unnamed_addr constant [5 x i8] c"&x&&\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [12 x i8], align 1
  %input = alloca [5 x i8], align 1
  %dst_index = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [12 x i8]* %buf, metadata !14, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [5 x i8]* %input, metadata !20, metadata !DIExpression()), !dbg !24
  %0 = bitcast [5 x i8]* %input to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([5 x i8], [5 x i8]* @__const.main.input, i32 0, i32 0), i64 5, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %dst_index, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %dst_index, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !31
  %conv = sext i32 %1 to i64, !dbg !31
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %input, i64 0, i64 0, !dbg !33
  %call = call i64 @strlen(i8* %arraydecay) #4, !dbg !34
  %cmp = icmp ult i64 %conv, %call, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !37
  %idxprom = sext i32 %2 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [5 x i8], [5 x i8]* %input, i64 0, i64 %idxprom, !dbg !40
  %3 = load i8, i8* %arrayidx, align 1, !dbg !40
  %conv2 = sext i8 %3 to i32, !dbg !40
  %cmp3 = icmp eq i32 38, %conv2, !dbg !41
  br i1 %cmp3, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %for.body
  %4 = load i32, i32* %dst_index, align 4, !dbg !43
  %inc = add nsw i32 %4, 1, !dbg !43
  store i32 %inc, i32* %dst_index, align 4, !dbg !43
  %idxprom5 = sext i32 %4 to i64, !dbg !45
  %arrayidx6 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom5, !dbg !45
  store i8 49, i8* %arrayidx6, align 1, !dbg !46
  %5 = load i32, i32* %dst_index, align 4, !dbg !47
  %inc7 = add nsw i32 %5, 1, !dbg !47
  store i32 %inc7, i32* %dst_index, align 4, !dbg !47
  %idxprom8 = sext i32 %5 to i64, !dbg !48
  %arrayidx9 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom8, !dbg !48
  store i8 50, i8* %arrayidx9, align 1, !dbg !49
  %6 = load i32, i32* %dst_index, align 4, !dbg !50
  %inc10 = add nsw i32 %6, 1, !dbg !50
  store i32 %inc10, i32* %dst_index, align 4, !dbg !50
  %idxprom11 = sext i32 %6 to i64, !dbg !51
  %arrayidx12 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom11, !dbg !51
  store i8 51, i8* %arrayidx12, align 1, !dbg !52
  %7 = load i32, i32* %dst_index, align 4, !dbg !53
  %inc13 = add nsw i32 %7, 1, !dbg !53
  store i32 %inc13, i32* %dst_index, align 4, !dbg !53
  %idxprom14 = sext i32 %7 to i64, !dbg !54
  %arrayidx15 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom14, !dbg !54
  store i8 52, i8* %arrayidx15, align 1, !dbg !55
  br label %if.end, !dbg !56

if.else:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !57
  %idxprom16 = sext i32 %8 to i64, !dbg !59
  %arrayidx17 = getelementptr inbounds [5 x i8], [5 x i8]* %input, i64 0, i64 %idxprom16, !dbg !59
  %9 = load i8, i8* %arrayidx17, align 1, !dbg !59
  %10 = load i32, i32* %dst_index, align 4, !dbg !60
  %inc18 = add nsw i32 %10, 1, !dbg !60
  store i32 %inc18, i32* %dst_index, align 4, !dbg !60
  %idxprom19 = sext i32 %10 to i64, !dbg !61
  %arrayidx20 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom19, !dbg !61
  store i8 %9, i8* %arrayidx20, align 1, !dbg !62
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4, !dbg !64
  %inc21 = add nsw i32 %11, 1, !dbg !64
  store i32 %inc21, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %retval, align 4, !dbg !69
  ret i32 %12, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buf", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 96, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 12)
!19 = !DILocation(line: 8, column: 7, scope: !9)
!20 = !DILocalVariable(name: "input", scope: !9, file: !10, line: 9, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 40, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 5)
!24 = !DILocation(line: 9, column: 7, scope: !9)
!25 = !DILocalVariable(name: "dst_index", scope: !9, file: !10, line: 10, type: !13)
!26 = !DILocation(line: 10, column: 6, scope: !9)
!27 = !DILocalVariable(name: "i", scope: !28, file: !10, line: 11, type: !13)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 2)
!29 = !DILocation(line: 11, column: 11, scope: !28)
!30 = !DILocation(line: 11, column: 7, scope: !28)
!31 = !DILocation(line: 11, column: 18, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !10, line: 11, column: 2)
!33 = !DILocation(line: 11, column: 29, scope: !32)
!34 = !DILocation(line: 11, column: 22, scope: !32)
!35 = !DILocation(line: 11, column: 20, scope: !32)
!36 = !DILocation(line: 11, column: 2, scope: !28)
!37 = !DILocation(line: 12, column: 19, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !10, line: 12, column: 6)
!39 = distinct !DILexicalBlock(scope: !32, file: !10, line: 11, column: 41)
!40 = !DILocation(line: 12, column: 13, scope: !38)
!41 = !DILocation(line: 12, column: 10, scope: !38)
!42 = !DILocation(line: 12, column: 6, scope: !39)
!43 = !DILocation(line: 13, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !10, line: 12, column: 23)
!45 = !DILocation(line: 13, column: 4, scope: !44)
!46 = !DILocation(line: 13, column: 21, scope: !44)
!47 = !DILocation(line: 14, column: 17, scope: !44)
!48 = !DILocation(line: 14, column: 4, scope: !44)
!49 = !DILocation(line: 14, column: 21, scope: !44)
!50 = !DILocation(line: 15, column: 17, scope: !44)
!51 = !DILocation(line: 15, column: 4, scope: !44)
!52 = !DILocation(line: 15, column: 21, scope: !44)
!53 = !DILocation(line: 16, column: 17, scope: !44)
!54 = !DILocation(line: 16, column: 4, scope: !44)
!55 = !DILocation(line: 16, column: 21, scope: !44)
!56 = !DILocation(line: 17, column: 3, scope: !44)
!57 = !DILocation(line: 19, column: 29, scope: !58)
!58 = distinct !DILexicalBlock(scope: !38, file: !10, line: 18, column: 8)
!59 = !DILocation(line: 19, column: 23, scope: !58)
!60 = !DILocation(line: 19, column: 17, scope: !58)
!61 = !DILocation(line: 19, column: 4, scope: !58)
!62 = !DILocation(line: 19, column: 21, scope: !58)
!63 = !DILocation(line: 21, column: 2, scope: !39)
!64 = !DILocation(line: 11, column: 38, scope: !32)
!65 = !DILocation(line: 11, column: 2, scope: !32)
!66 = distinct !{!66, !36, !67, !68}
!67 = !DILocation(line: 21, column: 2, scope: !28)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 22, column: 1, scope: !9)
